import QtQuick

Grid {
    id: myKolMonthView
    width: parent.width
    property int startDayOfMonth:0
    property var kolEmptyDays: []
    property var kolDaysNumber: []
    readonly property int startDayInMonthNameId: SystemAppInfo.startWeekWithSunday? -1:0
    property int selectedDay: -1
    signal dataChange()
    columns: 7

    onSelectedDayChanged: {
        for(let i=0;i<31;i++)
            if(kolDaysNumber[i].isSelected)
            {
                if((i+1)!==myKolMonthView.selectedDay)
                    kolDaysNumber[i].isSelected=false
            }else
                if((i+1)===myKolMonthView.selectedDay)
                {
                    if(kolDaysNumber[i].visible)
                        kolDaysNumber[i].isSelected=true
                }
    }

    onStartDayInMonthNameIdChanged: {
        myKolMonthView.recreateMonthView()
        myKolMonthView.changeMonthStartOn(myKolMonthView.startDayOfMonth)
    }

    function changeMonthStartOn(startOn: int): void
    {
        if(startOn>6 || startOn<0)
            return
        if(kolDaysNumber.length<1)
            myKolMonthView.recreateMonthView()
        if(SystemAppInfo.startWeekWithSunday)
        {
            for(let i=5;i>=0;i--)
                kolEmptyDays[i].visible=(startOn>i)? true:false
        }
        else
        {
            for(let i=5;i>=0;i--)
                if(startOn===0)
                    kolEmptyDays[i].visible=true
                else
                    kolEmptyDays[i].visible=(startOn>(i+1))? true:false
        }
    }

    function changeToCurrentMonth()
    {
        let cDate=new Date()
        myKolMonthView.recreateMonthView()
        myKolMonthView.changeMonthYearTo(cDate.getFullYear(),cDate.getMonth())
    }

    function changeMonthYearTo(year: int,month: int): void
    {
        if(year<0 || year>9999 || month<0 || month>11)
            return
        let dateOfView=new Date(year,month,1)
        let currentDay=new Date()
        myKolMonthView.startDayOfMonth=dateOfView.getDay()
        myKolMonthView.changeMonthStartOn(myKolMonthView.startDayOfMonth)
        myKolMonthView.kolDaysNumber[currentDay.getDate()-1].isCurrentDay=(dateOfView.getFullYear()===currentDay.getFullYear() && dateOfView.getMonth()===currentDay.getMonth())? true:false
        let daysInMonth=0
        switch(month)
        {
        case 0:
        case 2:
        case 4:
        case 6:
        case 7:
        case 9:
        case 11:
            daysInMonth=31
            break
        case 3:
        case 5:
        case 8:
        case 10:
            daysInMonth=30
            break
        case 1:
            if(year%4===0)
            {
                if(year%100===0)
                {
                    if(year%400===0)
                        daysInMonth=29
                    else
                        daysInMonth=28
                }else
                    daysInMonth=29
            }else
                daysInMonth=28
            break
        }

        for(let j=27;j<31;j++)
            myKolMonthView.kolDaysNumber[j].visible=((j+1)<=daysInMonth)? true:false
        resetDaysInfoToNewDataEvents()
    }

    function resetDaysInfoToNewDataEvents():void
    {
        for(let i=0;i<31;i++)
        {
            kolDaysNumber[i].hasEvent=false
            kolDaysNumber[i].isSelected=false
            myKolMonthView.selectedDay=-1
        }
        myKolMonthView.dataChange()
    }

    function addEvent(dayNumber:int)
    {
        if(dayNumber<0 || dayNumber>31)
            return
        kolDaysNumber[(dayNumber-1)].hasEvent=true
    }

    function addSelection(dayNumber: int)
    {
        if(dayNumber<0 || dayNumber>31)
            return
        kolDaysNumber[(dayNumber-1)].isSelected=true
    }

    function recreateMonthView():void
    {
        let str=""
        for(let i=0;i<7;i++)
        {
            switch(i+myKolMonthView.startDayInMonthNameId)
            {
            case 0:
                str=qsTr("Pon")
                break
            case 1:
                str=qsTr("Tor")
                break
            case 2:
                str=qsTr("Sre")
                break
            case 3:
                str=qsTr("Cet")
                break
            case 4:
                str=qsTr("Pet")
                break
            case 5:
                str=qsTr("Sob")
                break
            default:
                str=qsTr("Ned")
                break
            }
            if(kolEmptyDays.length!=6)
                Qt.createQmlObject('KolDay{value:"'+str+'"; width:'+myKolMonthView.width/7+';height:'+myKolMonthView.width/7+';}',myKolMonthView,'dayNames')
            else
                myKolMonthView.children[i].value=str
        }

        if(myKolMonthView.children.length>7)
            return

        for(let j=0;j<6;j++)
        {
            kolEmptyDays.push(Qt.createQmlObject('KolDay{value:""; width:'+myKolMonthView.width/7+';height:'+myKolMonthView.width/7+';}', myKolMonthView,'emptyItems'))
        }

        for(let k=1;k<32;k++)
            kolDaysNumber.push(Qt.createQmlObject('KolDay{value:"'+k+'"; width:'+myKolMonthView.width/7+';height:'+myKolMonthView.width/7+';onSelected:{myKolMonthView.selectedDay=value;}}',myKolMonthView,'dayNames'))
    }


    onWidthChanged: {
        for(let o=0;o<myKolMonthView.children.length;o++)
        {
            myKolMonthView.children[o].width=myKolMonthView.width/7
            myKolMonthView.children[o].height=myKolMonthView.width/7
        }
    }
}
