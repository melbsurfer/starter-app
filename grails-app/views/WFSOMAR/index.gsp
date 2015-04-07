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

    %{--Done: Add mustache template for image item in the list--}%
    <template id="image-template">
        <div class="row">
            <div class="col-md-2">
                <a class="thumbnail" href="http://omar.ossim.org/omar/mapView/imageSpace?layers={{properties.id}}">
                <img  class="img-rounded" style="width: 128px; height: 85px"
                      src="http://omar.ossim.org/omar/thumbnail/show/{{properties.id}}" alt="Image thumbnail" size="128"></a>
            </div>
            <div class="col-md-2">
                <small>
                    Date: acqDate<br>
                    Sensor:  {{properties.sensor_id}}<br>
                    Mission:{{properties.mission_id}}<br>
                    Type: {{properties.file_type}}
                </small>
                <hr>
            </div>
        </div>
    </template>

    <body>
        <div class="container">
            <div class="row">
                <div class="well">
                    <h1>wfsLoop</h1>
                </div>
            </div>
            <div ><span class="glyphicon glyphicon-star" aria-hidden="true"></span></div>
            <div id="omarImageList"></div>

        </div>
        <asset:javascript src="application.js"/>
    </body>

</html>