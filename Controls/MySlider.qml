import QtQuick
import QtQuick.Controls.Basic
import AppHub
import "../"
Slider {
    id: mySlider
    snapMode: Slider.SnapAlways
    background: MyRectangle{
        x: mySlider.leftPadding
        y: mySlider.topPadding+mySlider.availableHeight/2-height/2
        implicitWidth: 200
        implicitHeight: 14
        width: mySlider.availableWidth
        height: implicitHeight
        radius: MyTheme.controlCommon.controlRadius
        color: "#AAAAAA"
        MyRectangle{
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height-2*MyTheme.controlCommon.controlBorderWidth
            color: MyTheme.controlCommon.controlColor
            radius: parent.radius
            width: mySlider.visualPosition*(parent.width-2*MyTheme.controlCommon.controlBorderWidth)
            x: MyTheme.controlCommon.controlBorderWidth
        }
    }

    handle: MyRectangle{
        x: mySlider.leftPadding + mySlider.visualPosition * (mySlider.availableWidth - width)
        y: mySlider.topPadding + mySlider.availableHeight / 2 - height / 2
        implicitWidth: 30
        implicitHeight: 30
        radius: height/2
        color: mySlider.pressed? "darkgrey": (mySlider.hovered? "lightgrey": "white")
        borderWidth: MyTheme.controlCommon.controlBorderWidth
        borderColor: "black"
    }
}
