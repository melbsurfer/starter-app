<%--
  Created by IntelliJ IDEA.
  User: adrake
  Date: 4/4/15
  Time: 6:26 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>wfsOMAR</title>

        <asset:stylesheet src="application.css"/>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

        <!--[if lt IE 9]>
	    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->

    </head>

    %{--Done: Add mustache template for image item in the list--}%
    <template id="image-template">
        <div class="row" style="background-color: #424242; color: #c2c2c2">
            <div class="col-md-2">
                <a class="thumbnail" href="http://omar.ossim.org/omar/mapView/imageSpace?layers={{properties.id}}">
                <img  class="img-rounded" style="width: 128px; height: 85px"
                      src="http://omar.ossim.org/omar/thumbnail/show/{{properties.id}}" alt="Image thumbnail" size="128"></a>
            </div>
            <div class="col-md-2">
                <small>
                    <strong>Date: </strong>{{properties.acquisition_date}}<br>
                    <strong>Sensor: </strong>{{properties.sensor_id}}<br>
                    <strong>Mission: </strong>{{properties.mission_id}}<br>
                    <strong>Type: </strong> {{properties.file_type}}
                </small>
                <hr>
            </div>
        </div>
    </template>

    <body style="background-color: #303030">
        <div class="container">
            <div class="row">
                <div class="well">
                    <h1>wfsOMAR</h1>
                </div>
            </div>
            <div class="row" style="color: #c2c2c2">
                <div class="col-md-2">
                    <span id="imageCount">(X)</span> images in view
                </div>
                <div class="col-md-2">
                    <i class="fa fa-filter"></i>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4"><hr></div>
            </div>
            <div id="omarImageList"></div>

        </div>
        <asset:javascript src="application.js"/>
    </body>

</html>