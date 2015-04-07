/**
 * Created by adrake on 4/3/15.
 */
$(function() {

    // Done: 4-7-2015 - cache the DOM element so we only have to look at it once
    var $images = $('#omarImageList');

    var imageTemplate = $('#image-template').html();

    function addImage(image){
        $images.append(Mustache.render(imageTemplate, image));
    }

    //var wfsUrl = "wfs.json";
    //var wfsUrl = "http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:raster_entry&maxFeatures=200&outputFormat=geojson&filter=sensor_id='VIIRS'";
    var wfsUrl = "http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:raster_entry&maxFeatures=20&outputFormat=geojson&filter=file_type='tiff'";

    //Done: 4-6-2015 - Add date converision
    //Handlebars.registerHelper("formatDate", function convertDate(date){
    //    var stdDate;
    //    var date = new Date(date);
    //    stdDate = date.toLocaleDateString();
    //
    //    return stdDate;
    //
    //});

    $.ajax({
        url: wfsUrl,
        dataType: 'jsonp', // Avoid cross domain request issue
        // Done: 4-7-2015 - refactor "data" --> "images" for code clarity
        success: function (images) {
            console.log(images);

            //Done: 4-7-2015 - Add image count above the image list
            console.log(images.features.length);
            $('#imageCount').html(images.features.length);

            // Done: 4-7-2015 - refactor "obj" --> "image" for code clarity
            $.each(images.features, function (index, image) {

                //var acqDate;
                //acqDate = convertDate(image.properties.acquisition_date);

               addImage(image);

            });

        },
        error: function(){
            alert('Error fetching images.');
        }
    });

});