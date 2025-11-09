import QtQuick
import AppHub
MyRectangle{
    id: kolPanel
    property bool btnHovered: false
    property alias valueText: kolPanelData.text
    height: MyTheme.controlCommon.controlHeight
    color: "white"
    borderWidth: MyTheme.controlCommon.controlBorderWidth
    borderColor: (kolPanel.btnHovered || kolPanelMouse.isHovered)? Qt.lighter(MyTheme.controlCommon.controlColor,MyTheme.button.clickHoverRatio):"black"

    MyLabel{
        id: kolPanelData
        text: ""
        isBold: true
        fontSize: MyTheme.controlCommon.fontSize+2
        anchors.centerIn: parent
    }

    MyMouseArea{
        id: kolPanelMouse
    }
}
