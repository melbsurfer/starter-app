<%--
  Created by IntelliJ IDEA.
  User: adrake
  Date: 4/4/15
  Time: 6:26 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title></title>

        <asset:stylesheet src="application.css"/>

        <!--[if lt IE 9]>
	    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->

    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="well">
                    <h1>wfsLoop</h1>
                </div>
            </div>

            <!--<div id="omarImageList"></div>-->

            <table id="omarImageList" class="table table-striped table-hover table-condensed table-responsive">
                <caption>Tile Sets</caption>
                <tr>
                    <th>File Name</th>
                    <th>Ingest Date</th>
                    <th>Sensor</th>
                    <th>Mission</th>
                </tr>
            </table>

        </div>
        <asset:javascript src="application.js"/>
    </body>

</html>