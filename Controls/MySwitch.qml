import QtQuick
import AppHub
import "../BasicComponents"
import "../"
MyRectangle{
    id: mySwitch
    property bool checked: false

    radius: MyTheme.controlCommon.controlRadius
    height: MyTheme.controlCommon.controlHeight
    borderWidth: MyTheme.controlCommon.controlBorderWidth
    borderColor: "black"

    width: mySwitch.height*2+2* mySwitch.borderWidth
    color: mySwitch.checked? "limegreen":"orange"

    onCheckedChanged: {
        if(mySwitch.checked)
        {
            if(mySwitchOperator.x!==mySwitch.width-mySwitch.borderWidth-mySwitchOperator.width)
                mySwitchOperator.x=mySwitch.width-mySwitch.borderWidth-mySwitchOperator.width
        }
        else
        {
            if(mySwitchOperator.x!==mySwitch.borderWidth)
                mySwitchOperator.x=mySwitch.borderWidth
        }
    }

    MyRectangle{
        id: mySwitchOperator 
        color: (mySwitchAnimation.running || mySwitchMouseArea.pressed)? Qt.darker(MyTheme.controlCommon.controlColor, MyTheme.controlCommon.clickedHoverColorRatio): (mySwitchMouseArea.isHovered? Qt.lighter(MyTheme.controlCommon.controlColor,MyTheme.controlCommon.clickedHoverColorRatio):MyTheme.controlCommon.controlColor)
        height: parent.height-2*parent.borderWidth
        radius: MyTheme.controlCommon.controlRadius
        anchors.verticalCenter: parent.verticalCenter
        width: parent.height
        x: mySwitch.checked? mySwitch.width-mySwitch.borderWidth-mySwitchOperator.width:MyTheme.controlCommon.controlBorderWidth
    }

    MyMouseArea{
        id: mySwitchMouseArea
        onClicked: {
            if(!mySwitchAnimation.running)
                mySwitchAnimation.start()
        }
    }


    NumberAnimation {
        id: mySwitchAnimation
        target: mySwitchOperator
        property: "x"
        duration: 350
        from: mySwitch.checked? mySwitch.width-mySwitch.borderWidth-mySwitchOperator.width:mySwitch.borderWidth
        to:mySwitch.checked? mySwitch.borderWidth:mySwitch.width-mySwitch.borderWidth-mySwitchOperator.width
        onStopped: mySwitch.checked=!mySwitch.checked
    }
}
