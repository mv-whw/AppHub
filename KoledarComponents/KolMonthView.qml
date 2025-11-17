import QtQuick

Column {
    id: myKolMonthViewWhole
    width: 350
    spacing: 4
    property int selectedMonth: -1
    property int selectedYear: -1
    property int selectedDay: -1

    KolDataBar{
        id: leto
        width: parent.width
        isYearBar: true
        onValueChanged: {
            if(!mesec.overflowHappend)
                monthView.changeMonthYearTo(leto.value,mesec.value-1)
            else
                mesec.overflowHappend=false
        }
    }
    KolDataBar{
        id: mesec
        isYearBar: false
        width: parent.width
        property bool overflowHappend: false
        onOverflow: (isBack)=>{
                        mesec.overflowHappend=true
                        leto.valueText=(isBack)? (leto.value-1):(leto.value+1)
                    }
        onValueChanged: {

            monthView.changeMonthYearTo(leto.value,mesec.value-1)
        }
    }
    KolMonth{
        id: monthView
        width: parent.width
        onSelectedDayChanged: {
            if(monthView.selectedDay!==-1)
            {
                myKolMonthViewWhole.selectedDay=monthView.selectedDay
                myKolMonthViewWhole.selectedMonth=mesec.value
                myKolMonthViewWhole.selectedYear=leto.value
            }
        }

        onDataChange: {
            if(myKolMonthViewWhole.selectedDay!==-1)
            {
                if((myKolMonthViewWhole.selectedYear===leto.value) && (myKolMonthViewWhole.selectedMonth===mesec.value))
                {
                    if(myKolMonthViewWhole.selectedDay!==-1)
                        monthView.addSelection(myKolMonthViewWhole.selectedDay)
                    else
                    {
                        myKolMonthViewWhole.selectedMonth=-1
                        myKolMonthViewWhole.selectedYear=-1
                    }
                }
            }
        }

        Component.onCompleted: {
            let cDate=new Date()
            mesec.overflowHappend=true
            leto.valueText=cDate.getFullYear()
            mesec.valueText=cDate.getMonth()+1
            monthView.addSelection(cDate.getDate())
        }
    }
}
