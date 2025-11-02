import QtQuick
import QtQuick.Controls.Basic
//import AppHub
import "../"
import "../BasicComponents"
Frame {
    id: myFrame

    background: MyRectangle{
        radius: MyTheme.controlCommon.controlRadius
        borderWidth: MyTheme.controlCommon.controlBorderWidth
        borderColor: MyTheme.frameGroupBox.borderColor
        color: "transparent"
    }
    contentItem: Column{
        spacing: myFrame.spacing
        padding: myFrame.padding
    }
}
