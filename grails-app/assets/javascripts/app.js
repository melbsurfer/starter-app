/**
 * Created by adrake on 4/3/15.
 */
(function($) {

    //var wfsUrl = "http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:raster_entry&maxFeatures=10&outputFormat=geojson&filter=file_type='tiff'";
    //var wfsUrl = "http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:raster_entry&maxFeatures=10&outputFormat=geojson&filter=country='AS'";
    var wfsUrl = "wfs.json";


    $.ajax({
        url: wfsUrl,
        dataType: 'json',
        success: function (data) {
             console.log( data );

            $.each(data.features, function (idx, obj) {

                $("#omarImageList").append(
                    "<tr><td>" + obj.properties.filename +
                    "</td><td>" + obj.properties.ingest_date +
                    "</td><td>" + obj.properties.sensor_id +
                    "</td><td>" + obj.properties.mission_id +
                    "</td></tr>"
                );

            });

        }
    });



})(window.jQuery);