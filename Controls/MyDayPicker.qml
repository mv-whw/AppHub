import QtQuick
import AppHub
MyDialog {
    id: myDayPicker
    isOkVisible: true
    isCancelVisible: true
    dialogTitleText: qsTr("choose day")
    signal selectionChanged(day:int, month:int, year:int)
    width: myDayPickerView.width+20
    KolMonthView{
        id: myDayPickerView
        onHeightChanged: parent.height=myDayPickerView.height
    }

    onClickedOn: (btn)=>{
                     if(btn==="ok")
                     {
                         myDayPicker.selectionChanged(myDayPickerView.selectedDay,myDayPickerView.selectedMonth,myDayPickerView.selectedYear)
                     }
                     myDayPicker.close()
                 }
}
