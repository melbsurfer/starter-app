import geoscript.workspace.WFS
import geoscript.filter.Filter
import groovy.json.JsonSlurper

def wfs = new WFS("http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getCapabilities")
//def wfs = new WFS("http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:raster_entry&maxFeatures=100&outputFormat=geojson")

def slurper = new JsonSlurper()
def result = slurper.parseText('{"person":{"name":"Guillaume","age":33,"pets":["dog","cat"]}}')
println result

wfs.layers.each{println it}

wfs.close()














//def filter = new Filter("sensor_id='foo'")

//println filter.cql
//println filter.xml2