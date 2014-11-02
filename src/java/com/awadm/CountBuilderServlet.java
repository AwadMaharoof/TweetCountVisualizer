/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.awadm;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Awad Maharoof
 */
public class CountBuilderServlet extends HttpServlet {

    private ServletContext context;
    String host = "jdbc:derby://localhost:1527/TwitterStream";
    Connection con;
    Statement stmt;

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

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action"); //action comes with URL
        String uuid = request.getParameter("uuid"); //read param from url for hashtags

        if (uuid != null) {
            if (action.equals("count")) {
                //query
                String selectSQL = "SELECT TIMESTAMP, Count(ID) AS tblTimeCount FROM TBL_COUNT WHERE UUID = ? GROUP BY TIMESTAMP";
                //String selectSQL = "SELECT CONVERT(VARCHAR(16), TIMESTAMP) AS timekey, Count(ID) AS tblTimeCount FROM TBL_COUNT WHERE UUID = ? GROUP BY CONVERT(VARCHAR(16), TIMESTAMP)";
                try {
                    PreparedStatement updateemp = con.prepareStatement(selectSQL);
                    updateemp.setString(1, uuid);
                    ResultSet rSet = updateemp.executeQuery();
                    Gson gson = new Gson();

                    JsonObject jsonResponse = new JsonObject();
                    JsonArray data = new JsonArray();
           
                    while (rSet.next()) {
                        JsonArray row = new JsonArray();
                        row.add(new JsonPrimitive(rSet.getString("TIMESTAMP")));
                        row.add(new JsonPrimitive(rSet.getString("TBLTIMECOUNT")));
                        data.add(row);
                    }

                    jsonResponse.add("rows", data);
                    response.getWriter().write(gson.toJson(jsonResponse));

                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else { //no uuid came with request
            response.setStatus(HttpServletResponse.SC_NOT_IMPLEMENTED);
        }
    }
}
