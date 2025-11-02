import QtQuick
import QtQuick.Controls.Basic
import AppHub
Label{
    id: myLabel
    property alias fontSize: myLabel.font.pointSize
    property alias fontColor: myLabel.color
    property alias isBold: myLabel.font.bold
    property alias isItalic: myLabel.font.italic
    property alias isUnderlined: myLabel.font.underline

    font.pointSize: MyTheme.controlCommon.fontSize
    color: MyTheme.controlCommon.fontColor
}
