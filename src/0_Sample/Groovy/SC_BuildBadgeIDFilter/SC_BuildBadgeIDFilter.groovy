/* Refer the link below to learn more about the use cases of script.
https://help.sap.com/viewer/368c481cd6954bdfa5d0435479fd4eaf/Cloud/en/148851bf8192412cba1f9d2c17f4bd25.html

If you want to know more about the SCRIPT APIs, refer the link below
https://help.sap.com/doc/a56f52e1a58e4e2bac7f7adbf45b2e26/Cloud/en/index.html */
import com.sap.gateway.ip.core.customdev.util.Message
import java.util.HashMap
def Message processData(Message message) {

    ///Build property badgeIDFilter according previous payload
    //input parameter:
    //example: badgeIDFilter = &$filter=externalCode ge '1' and userId le '222'

    //Body
//    def body = message.getBody(String) // ON CPI
    def body = message.getBody() // Local

    //Parse the key from Original message
    def response = new XmlParser().parseText(body);
    def keys = response.'**'.findAll{ node-> node.name() == 'customString1' }*.text() // BadgeID in EmpEmployment: customString1

    // Sort, Remove duplicate and null
    keys.sort()
    keys.unique()
    while (keys.remove(null));
    while (keys.remove(''));

    //Formulate the filter query. Eg: 	$filter=externalCode in '1710-2018'
    def userIDList = "'" + keys.unique().join("','") + "'"
    if(!keys){
        message.setProperty("badgeIDFilter", "")
    } else{
        def minUserID = keys[0]
        def maxUserID = keys[-1]
        message.setProperty("badgeIDFilter", "and externalCode ge '" + minUserID +"' and externalCode le '"+ maxUserID +"'")
    }


    return message

}
