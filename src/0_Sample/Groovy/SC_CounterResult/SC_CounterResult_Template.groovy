/* Refer the link below to learn more about the use cases of script.
https://help.sap.com/viewer/368c481cd6954bdfa5d0435479fd4eaf/Cloud/en/148851bf8192412cba1f9d2c17f4bd25.html

If you want to know more about the SCRIPT APIs, refer the link below
https://help.sap.com/doc/a56f52e1a58e4e2bac7f7adbf45b2e26/Cloud/en/index.html */
import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;
import groovy.xml.XmlUtil
def Message processData(Message message) {
    /// Counter result to property: total, success, fail
    // property:
    //  SubBody: body for currenter splitter
    //  total: total for all
    //  success: success for all
    //  fail: fail for all

    // After splitter, will build final message: Seq 1: Process completed_Total: ${property.total} ,Success: ${property.success}, Fail: ${property.fail}

    //Body
//    def body = message.getBody(String) // ON CPI
    def body = message.getBody() // Local


    //Properties
    def properties = message.getProperties();
    def total = 0
    def success = 0
    def fail = 0

    // Build Check result: <errorMessage></errorMessage>
    def errorMessageStr = properties.get("errorMessage");
    if(!errorMessageStr) {
        errorMessageStr = "<errorMessage></errorMessage>" as String
    }
    def errorMessage = new XmlParser().parseText(errorMessageStr)

    //Parse the key from Original message
    def response = new XmlParser().parseText(body);
    for (sourceData in response.children()) {
        total += 1
        if('ERROR' != sourceData.status.text() ) {
            success += 1
        } else {
            fail += 1
            def msg = sourceData.message.text()
            def newNode = new NodeBuilder().errorMessage() {
                key('Error')
                value(msg)
                type('ERROR')
            }
            errorMessage.append(newNode)
        }
    }

    def finalResult = 'Process completed_Total: ' + total + ',Success: ' + success + ', Fail: ' + fail
    def finalResultNode = new NodeBuilder().errorMessage() {
        key('Process completed')
        value(finalResult)
        type('SUMMARY_SO_FAR')
    }
    errorMessage.append(finalResultNode)

    def emStr = XmlUtil.serialize(errorMessage).toString()
    emStr = emStr.replace("<?xml version=\"1.0\" encoding=\"UTF-8\"?>","")
    message.setProperty('errorMessage', emStr )
    return message;

}