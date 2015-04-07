/**
 * Created by adrake on 4/3/15.
 */
(function($) {

    // TODO: Add template for image item in the list
    var imageTemplate = "";

    //var wfsUrl = "wfs.json";
    //var wfsUrl = "http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:raster_entry&maxFeatures=200&outputFormat=geojson&filter=sensor_id='VIIRS'";
    var wfsUrl = "http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:raster_entry&maxFeatures=20&outputFormat=geojson&filter=file_type='tiff'";

    //Done: 4-6-2015 - Add date converision
    function convertDate(date){
        var stdDate;
        var date = new Date(date);
        stdDate = date.toLocaleDateString();

        return stdDate;

    }

    // Done: 4-7-2015 - cache the DOM element so we only have to look at it once
    var $images = $('#omarImageList');

    $.ajax({
        url: wfsUrl,
        dataType: 'jsonp', // Avoid cross domain request issue
        // Done: 4-7-2015 - refactor "data" --> "images" for code clarity
        success: function (images) {
             console.log(images);

            // Done: 4-7-2015 - refactor "obj" --> "image" for code clarity
            $.each(images.features, function (index, image) {

                var acqDate;
                acqDate = convertDate(image.properties.acquisition_date);

                $($images).append(

                    '<div class="row">' +
                        '<div class="col-md-2">' +
                            '<a href="http://omar.ossim.org/omar/mapView/imageSpace?layers=' + image.properties.id + '" class="thumbnail">' +
                            '<img  class="img-circle" style="width: 128px; height: 85px" src="http://omar.ossim.org/omar/thumbnail/show/' + image.properties.id + ' " alt="Image thumbnail" size="128"></a> ' +
                        '</div>' +
                        '<div class="col-md-2">' +
                            '<small>' +
                                'Date: ' + acqDate + '<br>' +
                                'Sensor: ' + image.properties.sensor_id + '<br>' +
                                'Mission: ' + image.properties.mission_id + '<br>' +
                                'Type: ' + image.properties.file_type +
                            '</small>' +
                            '<hr>'+
                        '</div>'
                  + '</div>'


                );

            });

        },
        error: function(){
            alert('Error fetching images.');
        }
    });



})(window.jQuery);