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
        property bool useCostumTime: false
        onHeightChanged: parent.height=height
    }

    function openWithTimeStamp(timeStamp: string):void
    {
        timeSelector.useCostumTime=true
        timeSelector.setTimeUsingTimeString(timeStamp)
        myTimePicker.open()
    }

    onOpened: {
        if(timeSelector.useCostumTime)
            timeSelector.useCostumTime=false
        else
            timeSelector.setTimeUsingTimeString(timeSelector.getCurrentTimeString())
    }

    onClickedOn:(btn)=> {
        if(btn==="ok")
            myTimePicker.timeSelected(timeSelector.returnSelectedTime())
        myTimePicker.close()
    }
}
