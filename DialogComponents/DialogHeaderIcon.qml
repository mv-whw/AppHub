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
        if(dialogIconAnimation.running)
            dialogIconAnimation.stop()
        switch(myDialogIcon.iconType)
        {
        case "error":
            dialogIconAnimation.startColor=Qt.lighter("orange",1.2)
            dialogIconAnimation.endColor="orange"
            myDialogIcon.sourceLocation="qrc:/qt/qml/AppHub/Icons/error.svg"
            break
        case "question":
            myDialogIcon.colorizationColor="white"
            myDialogIcon.sourceLocation="qrc:/qt/qml/AppHub/Icons/help.svg"
            break
        case "warning":

            dialogIconAnimation.startColor=Qt.lighter("yellow",1.2)
            dialogIconAnimation.endColor=Qt.darker("yellow",1.2)
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

    SequentialAnimation{
        id: dialogIconAnimation
        property color startColor: "white"
        property color endColor: "blue"
        ColorAnimation {
            target: myDialogIcon
            property: "colorizationColor"
            from: dialogIconAnimation.startColor
            to: dialogIconAnimation.endColor
            duration: 500
        }
        ColorAnimation {
            target: myDialogIcon
            property: "colorizationColor"
            from: dialogIconAnimation.endColor
            to: dialogIconAnimation.startColor
            duration: 500
        }
        loops: Animation.Infinite
    }

    onIsLoadedChanged: {
        if(myDialogIcon.isLoaded)
            switch(myDialogIcon.iconType)
            {
            case "error":
            case "warning":
                dialogIconAnimation.start()
                break
            default:
                if(dialogIconAnimation.running)
                    dialogIconAnimation.stop()
                myDialogIcon.colorizationColor="white"
            }
    }
}
