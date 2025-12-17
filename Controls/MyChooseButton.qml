import QtQuick
import AppHub
MyRectangle {
    id: myChooseButton
    property alias title: myChooseButtonText.text
    property alias iconSource: myChooseButtonIcon.sourceLocation
    property alias iconColorization: myChooseButtonIcon.colorization
    radius: MyTheme.controlCommon.controlRadius
    borderWidth: MyTheme.controlCommon.controlBorderWidth
    borderColor: MyTheme.button.backgroundColor
    color: MyTheme.button.backgroundColor

    MyIcon{
        id: myChooseButtonIcon
        property real animRatio: 1.0
        colorizationColor: "white"
        preferedHeight: parent.height*0.5
        anchors.horizontalCenter: parent.horizontalCenter
        y: ((parent.height)/2)-(height/2)-5
        onPreferedHeightChanged: {
            if(myChooseButtonIcon.isLoaded)
                myChooseButtonIcon.animRatio=myChooseButtonIcon.ratio+0.1
        }
        onIsLoadedChanged: {
            if(myChooseButtonIcon.isLoaded)
                myChooseButtonIcon.animRatio=myChooseButtonIcon.ratio+0.1
        }
    }

    MyLabel{
        id: myChooseButtonText
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        isBold: true
        y: parent.height-height-5
    }

    MyMouseArea{
        id: myChooseButtonMouse
        onPressed: myChooseButton.color=Qt.darker(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio)
        onEntered: {
            if(!myChooseButtonAnim.running)
                myChooseButtonAnim.start()
        }
        onExited: {
            if(myChooseButtonAnim.running)
                myChooseButtonAnim.stop()
            myChooseButton.color=MyTheme.button.backgroundColor
        }
        onClicked: {
            if(myChooseButtonAnim.running)
                myChooseButtonAnim.stop()
        }
    }

    SequentialAnimation{
        id: myChooseButtonAnim

        ParallelAnimation{
            ColorAnimation {
                target: myChooseButton
                property: "color"
                from: MyTheme.button.backgroundColor
                to: Qt.lighter(MyTheme.button.backgroundColor, 1.1)
                duration: 500
            }

            NumberAnimation {
                target: myChooseButtonIcon
                property: "ratio"
                from: myChooseButtonIcon.animRatio-0.1
                to: myChooseButtonIcon.animRatio
                duration: 500
            }
        }

        ParallelAnimation{
            ColorAnimation {
                target: myChooseButton
                property: "color"
                from: Qt.lighter(MyTheme.button.backgroundColor, 1.1)
                to: MyTheme.button.backgroundColor
                duration: 500
            }

            NumberAnimation {
                target: myChooseButtonIcon
                property: "ratio"
                from: myChooseButtonIcon.animRatio
                to: myChooseButtonIcon.animRatio-0.1
                duration: 500
            }
        }
        loops: Animation.Infinite
        onStopped: {
            myChooseButtonIcon.ratio=myChooseButtonIcon.animRatio-0.1
            myChooseButton.color=myChooseButtonMouse.isHovered? Qt.lighter(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio): MyTheme.button.backgroundColor
        }
    }
}
