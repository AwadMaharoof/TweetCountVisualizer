function doCompletion() {
    var url = "autocomplete?action=count&hash=" + escape($("#hashtags").val());
    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}

function stopStream() {
    var url = "autocomplete?action=stop";
    req = initRequest();
    req.open("GET", url, true);
    // req.onreadystatechange = callback;
    req.send(null);
}


function getCount() {
    window.setInterval(function() {
        updateChart();
    }, 1000);
}

function updateChart() {
    //var url = "countbuild?action=count&uuid=-2227443355675967322"; //$("#uuid").text();
    var url = "countbuild?action=count&uuid=" + $("#uuid").text();
    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = countCallback;
    req.send(null);
}

function countCallback() {
    if (req.readyState === 4) {
        if (req.status === 200) {
            buildArray(req.responseText);
        } else if (req.status === 501) {
            //$("#uuid").text("Please enter hashtags to count");
        }
    }
}

function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function callback() {
    if (req.readyState === 4) {
        if (req.status === 200) {
            $("#uuid").text(req.responseText);
        } else if (req.status === 501) {
            $("#uuid").text("Please enter hashtags to count");
        }
    }
}

$(document).ready(function() {
    //alert("load complete");
});

$(window).unload(function() {
    stopStream(); //stop stream if user navigates out of page
});

google.load("visualization", "1", {packages: ["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart() {
    var data = google.visualization.arrayToDataTable(
            ['Time Stamp', 'Tweets Per Minute'],
            ['', 0]);
    var options = {
        title: 'Real Time Count Visualization',
        curveType: 'function'
    };
    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}

function drawGraph(table) {
    var data = google.visualization.arrayToDataTable(table);
    var options = {
        title: 'Real Time Count Visualization'
    };
    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}

//main array hold table data
var table = [];
function jsonToTable(elem) {
    elem[1] = parseInt(elem[1]); //number for axis 0
    table.push(elem);
}

function buildArray(json) {
    json = jQuery.parseJSON(json);
    //build col header
    table = []; //reset table, because we be polling
    var header = ["Time Stamp", "Tweets Per Minute"];
    table.push(header); //head fisrt
    json.rows.forEach(jsonToTable); //push rest data to table
    drawGraph(table);
}