import QtQuick
import AppHub
MyDialog{
    id: myTimePicker
    dialogTitleText: qsTr("choose time")
    width: timeSelector.width+20
    isOkVisible: true
    isCancelVisible: true
    signal timeSelected(timeString:string)
    KolTime{
        id: timeSelector
        onHeightChanged: parent.height=height
    }

    onOpened: {
        timeSelector.setTimeUsingTimeString(timeSelector.getCurrentTimeString())
    }

    onClickedOn:(btn)=> {
        if(btn==="ok")
            myTimePicker.timeSelected(timeSelector.returnSelectedTime())
        myTimePicker.close()
    }
}
