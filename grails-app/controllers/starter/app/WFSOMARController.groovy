package starter.app

import geoscript.workspace.WFS
import geoscript.filter.Filter

class WFSOMARController {

    def index() { }

    def getWmsUrl(){

        def filter = new Filter("sensor_id='foo'")
        //println filter.cql
        //println filter.xml


        //def wfsUrl = new WFS("http://omar.ossim.org/omar/wfs?service=wfs&version=1.1" +
        //".0&request=getFeature&typeName=omar:raster_entry&maxFeatures=100&outputFormat=geojson")
        //def wfsUrl = "http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getCapabilities"

        def wfs = new WFS("http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getCapabilities")

        wfs.layers.each{println it}

        wfs.close()

    }
}
