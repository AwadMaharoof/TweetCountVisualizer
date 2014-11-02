package com.awadm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.UUID;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import twitter4j.FilterQuery;
import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;
import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;
import twitter4j.conf.ConfigurationBuilder;

/**
 *
 * @author awad maharoof
 */
public class StartStreamServlet extends HttpServlet {

    private ServletContext context;
    String host = "jdbc:derby://localhost:1527/TwitterStream";
    Connection con;
    Statement stmt;
    TwitterStream twitterStream;
    StatusListener listener;

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
        try {
            con = DriverManager.getConnection(host, "awad", "Pass1234");
            stmt = con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action"); //action comes with URL

        if (action.equals("count")) {
            String[] targetId = request.getParameter("hash").split(","); //read param from url for hashtags
            if (targetId != null) {
                long uuid = getUuid();
                response.getWriter().write(Long.toString(uuid)); //send uuid to cient
                getStream(uuid, targetId);
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_IMPLEMENTED);
            }
        } else if (action.equals("stop")) {
            stopStream();
        }

    }

    private void stopStream() {
        if (twitterStream != null) {
            if (listener != null) {
                twitterStream.removeListener(listener);
            }
        }

    }

    private void getStream(final long uuid, String[] track) {
        ConfigurationBuilder cb = new ConfigurationBuilder();
        cb.setDebugEnabled(true)
                .setOAuthConsumerKey("")
                .setOAuthConsumerSecret("")
                .setOAuthAccessToken("")
                .setOAuthAccessTokenSecret("");
        TwitterStreamFactory tsf = new TwitterStreamFactory(cb.build());
        twitterStream = tsf.getInstance();

        listener = new StatusListener() {
            @Override
            public void onStatus(Status status) {
                System.out.println("@" + status.getUser().getScreenName()
                        + " - " + status.getText());
                postCount(uuid, status.getId(), status.getCreatedAt());
            }

            @Override
            public void onDeletionNotice(
                    StatusDeletionNotice statusDeletionNotice) {
//				System.out.println("Got a status deletion notice id:"
//						+ statusDeletionNotice.getStatusId());
            }

            @Override
            public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
//				System.out.println("Got track limitation notice:"
//						+ numberOfLimitedStatuses);
            }

            @Override
            public void onScrubGeo(long userId, long upToStatusId) {
//				System.out.println("Got scrub_geo event userId:" + userId
//						+ " upToStatusId:" + upToStatusId);
            }

            @Override
            public void onStallWarning(StallWarning warning) {
//				System.out.println("Got stall warning:" + warning);
            }

            @Override
            public void onException(Exception ex) {
                ex.printStackTrace();
            }
        };
        FilterQuery fq = new FilterQuery();
        fq.track(track);
        twitterStream.addListener(listener);
        twitterStream.filter(fq);
    }

    private void postCount(long uuid, long tweetId, Date timeStamp) {
        java.sql.Timestamp sqlTimeStamp = new java.sql.Timestamp(timeStamp.getTime());
        sqlTimeStamp.setNanos(0);
        sqlTimeStamp.setSeconds(0);
        try {
            PreparedStatement updateemp = con.prepareStatement("INSERT INTO TBL_COUNT (UUID,TWEET_ID,TIMESTAMP) VALUES(?,?,?)");
            updateemp.setLong(1, uuid);
            updateemp.setLong(2, tweetId);
            updateemp.setTimestamp(3, sqlTimeStamp);
            updateemp.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private long getUuid() {
        return UUID.randomUUID().getMostSignificantBits();
    }
}
