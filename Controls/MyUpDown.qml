import QtQuick
import AppHub
Column {
    id: myUpDown

    property real min: 0.0
    property real max: 1.0
    property real value: myUpDown.min
    property real stepSize: 1.0
    property bool allowOverflow: true

    signal overflow(directionUp: bool)

    Component{
        id: myUpDownBtn

        MyRectangle{
            property bool isUp: true

            signal clickedOn(isUp:bool)

            height: MyTheme.controlCommon.controlHeight
            width: height*1.5
            topRightRadius: (isUp? MyTheme.controlCommon.controlRadius:0.0)
            topLeftRadius: (isUp? MyTheme.controlCommon.controlRadius:0.0)
            bottomLeftRadius: (isUp? 0.0: MyTheme.controlCommon.controlRadius)
            bottomRightRadius: (isUp? 0.0: MyTheme.controlCommon.controlRadius)

            color: myUpDownBtnMouse.pressed? Qt.darker(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio): (myUpDownBtnMouse.isHovered? Qt.lighter(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio):MyTheme.button.backgroundColor)

            MyLabel{
                text: parent.isUp? "<":">"
                anchors.centerIn: parent
                rotation: 90
                isBold: true
                color: MyTheme.button.fontColor
            }

            MyMouseArea{
                id: myUpDownBtnMouse
                anchors.fill: parent
                onClicked: parent.clickedOn(parent.isUp)
            }
        }
    }

    Component{
        id: myUpDownTxt
        MyRectangle{
            height: MyTheme.controlCommon.controlHeight
            width: height*1.5
            color: "white"
            borderWidth: 1.0
            borderColor: MyTheme.button.backgroundColor
            property real value: myUpDown.value
            MyLabel
            {
                id: myUpDownText
                anchors.centerIn: parent
                isBold: true
                fontSize: MyTheme.controlCommon.fontSize
                text: parent.value
            }
        }
    }

    Component.onCompleted: {
        let btn1= myUpDownBtn.createObject(myUpDown,{"isUp":true})
        myUpDownTxt.createObject(myUpDown)
        let btn2= myUpDownBtn.createObject(myUpDown,{"isUp":false})
        btn1.clickedOn.connect(myUpDown.clicked)
        btn2.clickedOn.connect(myUpDown.clicked)
    }

    function clicked(up:bool): void
    {
        if(up)
        {
            if(myUpDown.value+myUpDown.stepSize<=myUpDown.max)
                myUpDown.value+=myUpDown.stepSize
            else
                if(myUpDown.allowOverflow)
                {
                    myUpDown.value=myUpDown.min
                    myUpDown.overflow(true)
                }
        }
        else
        {
            if(myUpDown.value-myUpDown.stepSize>=myUpDown.min)
                myUpDown.value-=myUpDown.stepSize
            else
                if(myUpDown.allowOverflow)
                {
                    myUpDown.value=myUpDown.max
                    myUpDown.overflow(false)
                }
        }
    }
}
