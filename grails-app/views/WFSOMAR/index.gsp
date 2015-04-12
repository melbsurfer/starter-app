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

        <style>
            #image-card {
                border-top: 1px solid #eee;
                border-left: 1px solid #eee;
                border-right: 1px solid #eee;
                margin-bottom: 0px;
                border-radius: 6px;

                /*background-color: #ededed;*/
            }

            #image-card:hover {
                background-color: #eeeeee;
                border: 1px solid #57a3ff;
                -webkit-box-shadow: 3px 3px 3px 0px rgba(50, 50, 50, 0.75);
                -moz-box-shadow:    3px 3px 3px 0px rgba(50, 50, 50, 0.75);
                box-shadow:         3px 3px 3px 0px rgba(50, 50, 50, 0.75);

            }

            .col-md-4 {
                padding-left: 5px;
                padding-right: 0px;
            }

            .col-md-8 {
                padding-left: 12px;
                padding-right: 0px;
            }

            #image-card-thumb{
                cursor: pointer;
            }

            #image-card-info {
                padding-top: 8px;
                font-size: 11px;
            }

            #image-card-info {
                font-size: 11px;
            }

            #image-card-info hr {
                margin-top: 5px;
                margin-bottom: 5px;
            }

            #image-card-info .fa {
                color: #57a3ff;
                cursor: pointer;
            }

            #left, #right {
                position: relative;
                float: left;
                margin: 0 5px 0 0;
                border: 1px solid #337ab7;
                width: 200px;
                height: 400px;
                overflow: hidden;
            }

            div.panel {
                position: absolute;
                height: 100%;
                width: 100%;
                display: none;
            }

        </style>

        <!--[if lt IE 9]>
	    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->

    </head>
    %{--Done: Add mustache template for image item in the list--}%
    <script id="image-template"  type="text/x-handlebars-template">
        {{#features}}
        <div class="row">
            <div id="image-card" class="col-md-4">
                <div id="image-card-thumb" class="col-md-4">
                    <img data-toggle="tooltip" data-placement="bottom"
                          title="Add image to current tile layer" class="omar-thumb" style="width: 128px;
                    height: 95px;
                    margin-top: 10px;"
                          src="http://localhost:9999/omar/thumbnail/show/{{properties.id}}" alt="Image thumbnail"
                          size="128">
                </div>
                <div id="image-card-info" class="col-md-8">
                    <strong>ID: </strong>{{properties.id}}&nbsp;&nbsp;<strong>Type: </strong>
                    {{properties.file_type}}<br>
                    <strong>Acq. Date: </strong>{{formatDate properties.acquisition_date}}<br>
                    <strong>Ingest Date: </strong>{{formatDate properties.ingest_date}}<br>
                    <strong>Sensor: </strong>{{formatString properties.sensor_id}}<br>
                    <strong>Mission: </strong><span>{{formatString properties.mission_id}}</span>
                    <hr>
                    <i class="fa fa-ellipsis-h fa-lg" data-toggle="tooltip" data-placement="bottom"
                       title="View image metadata"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="" href="http://localhost:9999/omar/mapView/imageSpace?layers={{properties.id}}"
                       target="_blank"><i id="viewInOmar" class="fa fa-globe fa-lg" data-toggle="tooltip" data-placement="bottom"
                                          title="View image in OMAR"></i></a>
                    <br>
                    <br>
                </div>
            </div>
        </div>
        {{/features}}
    </script>

    <body>
        <div class="container">
            <div class="row">
                <div class="well">
                    <h1>wfsOMAR</h1>
                </div>
            </div>
            <div class="row">
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

            <div id="left">
                <a href="#target1" class="panel">Target 1</a><br/>
                <a href="#target2" class="panel">Target 2</a><br/>
                <a href="#target3" class="panel">Target 3</a><br/>
            </div>

            <div id="right">
                <div class="panel" id="target1" style="background:green">Image List</div>
                <div class="panel" id="target2" style="background:#f8901b">Image Metadata</div>
                <div class="panel" id="target3" style="background:yellow">Image Filters</div>
            </div>

        </div>
        <asset:javascript src="application.js"/>
    </body>

</html>