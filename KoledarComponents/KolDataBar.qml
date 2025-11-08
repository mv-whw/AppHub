import QtQuick

Row {
    id: kolDataBar
    property alias valueText: kolDataBarPanel.valueText
    property int value: isNaN(kolDataBar.valueText)? 0: parseInt(kolDataBar.valueText)
    KolChangeButton{id: kolDataBarBtn;isBackButton: true}
    KolDataPanel{id: kolDataBarPanel; width: parent.width-2*kolDataBarBtn.width}
    KolChangeButton{}
}
