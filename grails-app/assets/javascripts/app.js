/**
 * Created by adrake on 4/3/15.
 */
(function($) {

    var wfsUrl = "http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:raster_entry&maxFeatures=200&outputFormat=geojson&filter=sensor_id='VIIRS'";
    //var wfsUrl = "http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:raster_entry&maxFeatures=10&outputFormat=geojson&filter=country='AS'";
    //var wfsUrl = "wfs.json";
    //git@github.com:melbsurfer/starter-app.git

    $.ajax({
        url: wfsUrl,
        dataType: 'jsonp', // Avoid cross domain request issue
        success: function (data) {
             console.log( data );

            $.each(data.features, function (idx, obj) {

                //$("#omarImageList").append(
                //    "<tr><td>" + obj.properties.filename +
                //    "</td><td>" + obj.properties.ingest_date +
                //    "</td><td>" + obj.properties.sensor_id +
                //    "</td><td>" + obj.properties.mission_id +
                //    "</td></tr>"
                //);

                $("#omarImageList").append(
                    //"<tr><td>" + obj.properties.filename +
                    //"</td><td>" + obj.properties.ingest_date +
                    //"</td><td>" + obj.properties.sensor_id +
                    //"</td><td>" + obj.properties.mission_id +
                    //"</td></tr>"

                    'Date: ' + obj.properties.ingest_date + '<br>' +
                    'Sensor: ' + obj.properties.sensor_id + '<br>' +
                    'Mission: ' + obj.properties.mission_id + '<br>'


                );

            });

        }
    });



})(window.jQuery);