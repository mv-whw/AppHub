import QtQuick
import QtQuick.Controls.Basic
import AppHub
import "../"
RangeSlider {
    id: myRangeSlider
    snapMode: RangeSlider.SnapAlways
    background: MyRectangle{
        x: myRangeSlider.leftPadding
        y: myRangeSlider.topPadding+myRangeSlider.availableHeight/2-height/2
        implicitWidth: 200
        implicitHeight: 14
        width: myRangeSlider.availableWidth
        height: implicitHeight
        radius: MyTheme.controlCommon.controlRadius
        color: "#AAAAAA"
        MyRectangle{
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height-2*MyTheme.controlCommon.controlBorderWidth
            color: MyTheme.controlCommon.controlColor
            radius: parent.radius
            width: myRangeSlider.second.visualPosition*(parent.width-2*MyTheme.controlCommon.controlBorderWidth)-x
            x: MyTheme.controlCommon.controlBorderWidth+ myRangeSlider.first.visualPosition*(parent.width-2*MyTheme.controlCommon.controlBorderWidth)
        }
    }

    first.handle: MyRectangle{
        x: myRangeSlider.leftPadding + myRangeSlider.first.visualPosition * (myRangeSlider.availableWidth - width)
        y: myRangeSlider.topPadding + myRangeSlider.availableHeight / 2 - height / 2
        implicitWidth: 30
        implicitHeight: 30
        radius: height/2
        color: myRangeSlider.first.pressed? "darkgrey": (myRangeSlider.first.hovered? "lightgrey": "white")
        borderWidth: MyTheme.controlCommon.controlBorderWidth
        borderColor: "black"
    }
    second.handle: MyRectangle{
        x: myRangeSlider.leftPadding + myRangeSlider.second.visualPosition * (myRangeSlider.availableWidth - width)
        y: myRangeSlider.topPadding + myRangeSlider.availableHeight / 2 - height / 2
        implicitWidth: 30
        implicitHeight: 30
        radius: height/2
        color: myRangeSlider.second.pressed? "darkgrey": (myRangeSlider.second.hovered? "lightgrey": "white")
        borderWidth: MyTheme.controlCommon.controlBorderWidth
        borderColor: "black"
    }
}
