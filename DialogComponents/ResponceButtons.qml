import QtQuick
import AppHub
//import "../BasicComponents"
//import "../"
Row {
    id: myResponceRow
    signal clickedOn(btn:string)

    property alias isYesVisible: yesBtn.visible
    property alias isNoVisible: noBtn.visible
    property alias isOkVisible: okBtn.visible
    property alias isApplyVisible: applyBtn.visible
    property alias isRetryVisible: retryBtn.visible
    property alias isCancelVisible: cancelBtn.visible

    MyButton{id: yesBtn; text: qsTr("yes");visible: false; onClicked: myResponceRow.clickedOn("yes");}
    MyButton{id: noBtn; text: qsTr("no");visible: false; onClicked: myResponceRow.clickedOn("no");}
    MyButton{id: okBtn; text: qsTr("ok");visible: false; onClicked: myResponceRow.clickedOn("ok");}
    MyButton{id: applyBtn; text: qsTr("apply");visible: false; onClicked: myResponceRow.clickedOn("apply");}
    MyButton{id: retryBtn; text: qsTr("retry");visible: false; onClicked: myResponceRow.clickedOn("retry");}
    MyButton{id: cancelBtn; text: qsTr("cancel");visible: false; onClicked: myResponceRow.clickedOn("cancel");}

}
