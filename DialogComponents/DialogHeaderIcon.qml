import QtQuick
import AppHub
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
            myDialogIcon.sourceLocation=MyIconType.getIconPath("error")
            dialogIconAnimation.start()
            break
        case "question":
            myDialogIcon.colorizationColor="white"
            myDialogIcon.sourceLocation=MyIconType.getIconPath("help")
            break
        case "warning":

            dialogIconAnimation.startColor=Qt.lighter("yellow",1.2)
            dialogIconAnimation.endColor=Qt.darker("yellow",1.2)
            myDialogIcon.sourceLocation=MyIconType.getIconPath("warning")
            dialogIconAnimation.start()
            break
        case "info":
            myDialogIcon.colorizationColor="white"
            myDialogIcon.sourceLocation=MyIconType.getIconPath("info")
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
