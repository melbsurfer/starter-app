import geoscript.workspace.WFS
import geoscript.filter.Filter

def filter = new Filter("sensor_id='foo'")

println filter.cql
println filter.xml 

def wfs = new WFS("http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getCapabilities")

wfs.layers.each{println it}

wfs.close()

// http://omar.ossim.org/omar/wfs?service=wfs&version=1.1.0&request=getFeature&typeName=omar:video_data_set&maxFeatures=10&outputFormat=geojson&filter=file_type='tiff'