import QtQuick
import AppHub
MyRectangle {
    id: changeDataBtn
    property bool isBackButton: false
    readonly property alias isHovered: changeDataMouse.isHovered
    signal clickedOn()
    width: 50
    height: 48
    color: changeDataMouse.pressed? Qt.darker(MyTheme.controlCommon.controlColor,MyTheme.button.clickHoverRatio):(changeDataMouse.isHovered? Qt.lighter(MyTheme.controlCommon.controlColor,MyTheme.button.clickHoverRatio):MyTheme.controlCommon.controlColor)

    topRightRadius: changeDataBtn.isBackButton? 0.0:MyTheme.controlCommon.controlRadius
    bottomRightRadius: changeDataBtn.isBackButton? 0.0:MyTheme.controlCommon.controlRadius
    topLeftRadius: changeDataBtn.isBackButton? MyTheme.controlCommon.controlRadius:0.0
    bottomLeftRadius: changeDataBtn.isBackButton? MyTheme.controlCommon.controlRadius:0.0
    borderWidth: MyTheme.controlCommon.controlBorderWidth
    borderColor: MyTheme.controlCommon.controlColor

    MyLabel{
        anchors.centerIn: parent
        color: MyTheme.button.fontColor
        fontSize: MyTheme.controlCommon.fontSize+2
        isBold: true
        text: changeDataBtn.isBackButton? "<<":">>"
    }

    MyMouseArea{
        id: changeDataMouse
        onClicked: changeDataBtn.clickedOn()
    }
}
