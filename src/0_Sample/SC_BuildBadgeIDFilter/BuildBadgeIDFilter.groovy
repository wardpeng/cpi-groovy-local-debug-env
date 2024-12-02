package main.HKJC.INT016_1.SC_FilterEmpEmploymentByStatus

import com.sap.gateway.ip.core.customdev.processor.MessageImpl
import com.sap.gateway.ip.core.customdev.util.Message

def scriptDir = new File(getClass().protectionDomain.codeSource.location.toURI().path).parent
def dataDir = scriptDir + "\\Data"

// Load Groovy Script
GroovyShell shell = new GroovyShell()
def script = shell.parse(new File(scriptDir + "\\SC_BuildBadgeIDFilter.groovy"))

File inputFile = new File("$dataDir\\body.xml")
//File perBodyFile = new File("$dataDir\\perBody.txt")
File outputFile = new File("$dataDir\\output.xml")

def inputBody = inputFile.getText("UTF-8")

Message msg = new MessageImpl()

msg.setBody(new String(inputBody))

msg.setProperty("BadgeID", "83902")

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
//outputBody = msg.getBody()
//println("Body:\r\n" + outputBody)
//outputFile.write outputBody