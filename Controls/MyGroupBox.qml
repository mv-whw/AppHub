import QtQuick
import QtQuick.Controls.Basic
//import AppHub
import "../BasicComponents"
import "../"

GroupBox {
    id: myGroupBox
    background: MyRectangle{
        y: myGroupBox.topPadding-myGroupBox.bottomPadding
        width: parent.width
        height: parent.height-myGroupBox.topPadding+myGroupBox.bottomPadding
        radius: MyTheme.controlCommon.controlRadius
        color: "transparent"
        borderWidth: MyTheme.controlCommon.controlBorderWidth
        borderColor: MyTheme.frameGroupBox.borderColor
    }
    contentItem: Column{
        padding: myGroupBox.padding
        spacing: myGroupBox.spacing
    }

    label: MyLabel{
        x: 10
        elide: MyLabel.ElideRight
        text: myGroupBox.title
        width: myGroupBox.availableWidth-x
        isBold: true
        isUnderlined: true
    }
}
