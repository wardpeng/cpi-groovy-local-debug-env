package Template.SC_CounterResult

import com.sap.gateway.ip.core.customdev.processor.MessageImpl
import com.sap.gateway.ip.core.customdev.util.Message

def scriptDir = new File(getClass().protectionDomain.codeSource.location.toURI().path).parent
def dataDir = scriptDir + "\\Data"

// Load Groovy Script
GroovyShell shell = new GroovyShell()
def script = shell.parse(new File(scriptDir + "\\SC_CounterResult_Template.groovy"))

// Initialize message with body, header and property
Map headers = [:]
Map props = [:]
headers.put("field1", "John")
props.put("text1", "How are you?")

File outputFile = new File("$dataDir\\output.xml")

Message msg = new MessageImpl()
msg.setProperty("PerBody.xml", new String(new File("$dataDir\\PerBody.xml").getText("UTF-8")))
msg.setBody(new String(new File("$dataDir\\body.xml").getText("UTF-8")))
msg.setProperty("MandatoryDumyField", "MandatoryDumyField")

// Execute script
msg = script.processData(msg)


//// Display results of script in console
def displayMaps = { String mapName, Map map ->
    println mapName
    map.each { key, value -> println(key + " = " + value) }
}
println("---")
displayMaps("Headers:", msg.getHeaders())

println("---")
displayMaps("Properties:", msg.getProperties())

println("---")
outputBody = msg.getBody()
println("Body:\r\n" + outputBody)
outputFile.write outputBody
