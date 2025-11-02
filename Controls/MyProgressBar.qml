import QtQuick
import QtQuick.Controls.Basic
//import AppHub
import "../BasicComponents"
import "../"
Column {
    id: myProgressBarCol
    property alias detailsText: myProgressBarDetails.text
    property alias progresValue: myProgressBar.value
    spacing: 0
    Row{
        spacing: 10
        ProgressBar{
            id: myProgressBar
            from: 0
            to: 100
            width: myProgressBarCol.width-parent.spacing-myProgressBarPerc.width
            background: MyRectangle{
                implicitWidth: 200
                implicitHeight: 48
                color: "grey"
                radius: MyTheme.controlCommon.controlRadius
            }
            contentItem: Item{
                implicitWidth: myProgressBar.background.implicitWidth
                implicitHeight: myProgressBar.background.implicitHeight

                MyRectangle{
                    width: myProgressBar.visualPosition*(myProgressBar.width-2)
                    x: 1
                    height: parent.height-2
                    anchors.verticalCenter: parent.verticalCenter
                    radius: MyTheme.controlCommon.controlRadius
                    color: MyTheme.controlCommon.controlColor
                }
            }
        }
        MyLabel{
            id: myProgressBarPerc
            text: myProgressBar.value+"%"
            width: 50
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    MyLabel{
        id: myProgressBarDetails
        isItalic: true
        fontSize: MyTheme.controlCommon.fontSize-2
        wrapMode: MyLabel.WrapAtWordBoundaryOrAnywhere
        width: parent.width
    }
}
