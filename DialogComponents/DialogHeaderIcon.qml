import QtQuick
//import AppHub
import "../"
import "../BasicComponents"
MyIcon {
    id: myDialogIcon
    property string iconType: ""
    height: parent.height*0.8
    colorization: 1.0
    colorizationColor: "white"

    onIconTypeChanged: {
        switch(myDialogIcon.iconType)
        {
        case "error":
            myDialogIcon.sourceLocation="qrc:/qt/qml/AppHub/Icons/error.svg"
            break
        case "question":
            myDialogIcon.sourceLocation="qrc:/qt/qml/AppHub/Icons/help.svg"
            break
        case "warning":
            myDialogIcon.sourceLocation="qrc:/qt/qml/AppHub/Icons/warning.svg"
            break
        case "info":
            myDialogIcon.sourceLocation="qrc:/qt/qml/AppHub/Icons/info.svg"
            break
        default:
            myDialogIcon.sourceLocation=""
            break
        }
    }

}
