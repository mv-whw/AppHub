import QtQuick
import QtQuick.Controls.Basic
import AppHub
//import "../"
//import "../BasicComponents"
Button{
    id: myButton

    hoverEnabled:true
    background: MyRectangle{
        implicitHeight: MyTheme.controlCommon.controlHeight
        implicitWidth: 100
        borderColor: Qt.darker(MyTheme.controlCommon.controlColor,MyTheme.controlCommon.clickedHoverColorRatio)
        borderWidth: (myButton.pressed || myButton.hovered)? (MyTheme.controlCommon.controlBorderWidth*MyTheme.controlCommon.controlBorderRatio): MyTheme.controlCommon.controlBorderWidth
        color: myButton.pressed? (Qt.darker(MyTheme.controlCommon.controlColor,MyTheme.controlCommon.clickedHoverColorRatio)):(myButton.hovered? Qt.lighter(MyTheme.controlCommon.controlColor,MyTheme.controlCommon.clickedHoverColorRatio):MyTheme.controlCommon.controlColor)
        radius: MyTheme.controlCommon.controlRadius
    }

    contentItem: MyLabel{
        text: myButton.text
        fontSize: MyTheme.controlCommon.fontSize
        color: MyTheme.button.fontColor
        isBold: true
        verticalAlignment: MyLabel.AlignVCenter
        horizontalAlignment: MyLabel.AlignHCenter
    }
}
