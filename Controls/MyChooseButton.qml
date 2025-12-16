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

    MyIcon{
        id: myChooseButtonIcon
        colorizationColor: "white"
        preferedHeight: parent.height*0.75
    }

    MyLabel{
        id: myChooseButtonText
        color: "white"
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
                myChooseButtonAnim.stop
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
                target: myChooseButtonIcon
                from: MyTheme.button.backgroundColor
                to: Qt.darker(MyTheme.button.backgroundColor, MyTheme.button.clickHoverRatio)
                duration: 350
            }

            NumberAnimation {
                target: myChooseButtonIcon
                property: "preferedHeight"
                from: myChooseButton.height*0.75
                to: myChooseButton.height*0.85
                duration: 350
            }
        }

        ParallelAnimation{
            ColorAnimation {
                target: myChooseButtonIcon
                from: Qt.darker(MyTheme.button.backgroundColor, MyTheme.button.clickHoverRatio)
                to: MyTheme.button.backgroundColor
                duration: 350
            }

            NumberAnimation {
                target: myChooseButtonIcon
                property: "preferedHeight"
                from: myChooseButton.height*0.85
                to: myChooseButton.height*0.75
                duration: 350
            }
        }
        loops: Animation.Infinite
        onStopped: {
            myChooseButtonIcon.preferedHeight=myChooseButton.height*0.75
            myChooseButton.color=myChooseButtonMouse.isHovered? Qt.darker(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio): MyTheme.button.backgroundColor
        }
    }
}
