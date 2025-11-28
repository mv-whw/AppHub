import QtQuick
import AppHub
Row {
    id: kolTime
    spacing: 4
    readonly property alias hourM: myhM.value
    readonly property alias hourm: myhm.value
    readonly property alias minM: mymM.value
    readonly property alias minm: mymm.value


    MyUpDown{
        id: myhM
        min: 0.0
        max: 2
        onValueChanged:{
            if(myhM.value===2 && myhm.value>3)
                myhm.value=3
        }
    }
    MyUpDown{
        id: myhm
        min: 0.0
        max: myhM.value===2? 3:9
    }
    MyLabel{
        anchors.verticalCenter: parent.verticalCenter
        isBold: true
        text: ":"
        fontSize: MyTheme.controlCommon.fontSize+2
    }
    MyUpDown{
        id: mymM
        min: 0.0
        max: 5.0
    }
    MyUpDown{
        id: mymm
        min: 0.0
        max: 9.0
    }

    function returnSelectedTime(): string
    {
        return ""+kolTime.hourM+""+kolTime.hourm+":"+kolTime.minM+""+kolTime.minm
    }

    function setTimeUsingTimeString(timeString: string):bool
    {
        // if(timeString.length!==5 || timeString[2]!==":" || isNaN(timeString.substring(0,2)) || isNaN(timeString.substring(3)))
        //     return false
        myhM.value= parseInt(timeString[0])
        myhm.value= parseInt(timeString[1])
        mymM.value= parseInt(timeString[3])
        mymm.value=parseInt(timeString[4])
        return true
    }

    function getCurrentTimeString():string
    {
        let cTime=new Date()
        let timeString=""
        if((cTime.getHours()/10)<=1)
            timeString+="0"
        timeString+=cTime.getHours()+":"
        if((cTime.getMinutes()/10)<=1)
            timeString+="0"
        timeString+=cTime.getMinutes()
        return timeString
    }
}
