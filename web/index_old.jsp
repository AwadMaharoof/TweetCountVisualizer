<html>
    <head>
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript" src="js/scripts.js"></script>
    </head>
    <body>
        <form name="autofillform" action="autocomplete">
            Text you want to filter tweets by:<input type="text" id="hashtags"/>
            <input type="button" value="Start recording stream" onclick="doCompletion()">
        </form>
        <form name="getCountform" action="getcount">
            <input type="button" value="Start polling DB" onclick="getCount()">
        </form>


        Your UUID: <div id="uuid"></div>
        <div id="chart_div" style="width: 900px; height: 500px;"></div>
    </body>
</html>
