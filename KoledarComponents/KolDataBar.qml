import QtQuick

Row {
    id: kolDataBar
    property bool isYearBar: false
    signal overflow(lastYear:bool)
    property alias valueText: kolDataBarPanel.valueText
    readonly property int value: parseInt(kolDataBar.valueText)
    KolChangeButton{id: kolDataBarBtn;isBackButton: true;
        onClickedOn: {
            if(!kolDataBar.isYearBar && kolDataBar.value===1)
            {
                kolDataBar.overflow(true)
                kolDataBar.valueText=12
            }
            else
                kolDataBar.valueText=kolDataBar.value-1
        }
    }
    KolDataPanel{id: kolDataBarPanel; width: parent.width-2*kolDataBarBtn.width}
    KolChangeButton{
        onClickedOn: {
            if(!kolDataBar.isYearBar && kolDataBar.value===12)
            {
                kolDataBar.overflow(false)
                kolDataBar.valueText=1
            }
            else
                kolDataBar.valueText=kolDataBar.value+1
        }
    }
}
