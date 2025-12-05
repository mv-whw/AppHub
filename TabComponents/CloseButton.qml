import QtQuick
import AppHub
MyRectangle {
    height: parent.height*0.8
    width: height
    readonly property alias isHovered: closeBtnMouse.isHovered
    signal clickedOn()

    color:"transparent"
    borderWidth: closeBtnMouse.isHovered? MyTheme.controlCommon.controlBorderWidth:0.0
    borderColor: "white"

    MyLabel{
        id: closeTxt
        isBold: true
        anchors.centerIn: parent
        text: "X"
        fontSize: MyTheme.controlCommon.fontSize+2
        color: "white"

        SequentialAnimation{
            id: closeAnim
            NumberAnimation {
                target: closeTxt
                property: "fontSize"
                from: MyTheme.controlCommon.fontSize-3
                to: MyTheme.controlCommon.fontSize+3
                duration: 250
            }
            NumberAnimation {
                target: closeTxt
                property: "fontSize"
                from: MyTheme.controlCommon.fontSize+3
                to: MyTheme.controlCommon.fontSize-3
                duration: 250
            }
            onStopped: closeTxt.fontSize=MyTheme.controlCommon.fontSize+2
            loops: Animation.Infinite
        }
    }

    MyMouseArea{
        id: closeBtnMouse
        anchors.fill: parent
        onIsHoveredChanged: {
            if(closeBtnMouse.isHovered)
            {
                if(!closeAnim.running)
                    closeAnim.start()
            }
            else
            {
                if(closeAnim.running)
                    closeAnim.stop()
            }
        }

        onClicked: parent.clickedOn()
    }
}
