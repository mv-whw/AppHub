import QtQuick
import QtQuick.Controls.Basic
import AppHub

Popup {
    id: myBusyIndicator
    property var balls: []
    width: 250
    height: 20
    closePolicy: Popup.NoAutoClose
    background: MyRectangle{
        id: busyBack
        color: "transparent"
        clip: true
    }

    onVisibleChanged: {
        if(myBusyIndicator.visible)
        {
            if(!busyIndicatorAnim.running)
                busyIndicatorAnim.start()
        }
        else
        {
            if(busyIndicatorAnim.running)
                busyIndicatorAnim.stop()
        }
    }

    Component{
        id: ball

        MyRectangle{
            height: myBusyIndicator.height
            width: myBusyIndicator.height
            radius: myBusyIndicator.height
            borderColor: MyTheme.button.backgroundColor
            borderWidth: MyTheme.controlCommon.controlBorderWidth
            color: Qt.lighter(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio)
        }
    }

    SequentialAnimation{
        id: busyIndicatorAnim


        ParallelAnimation{
            NumberAnimation {
                id: busyIndicatorBall1FirstAni
                property: "x"
                from: -110
                to:0
                duration: 750
            }
            NumberAnimation {
                id: busyIndicatorBall2FirstAni
                property: "x"
                from: -80
                to:30
                duration: 750
            }
            NumberAnimation {
                id: busyIndicatorBall3FirstAni
                property: "x"
                from: -50
                to:60
                duration: 750
            }
            NumberAnimation {
                id: busyIndicatorBall4FirstAni
                property: "x"
                from: -20
                to:90
                duration: 750
            }
        }
        SequentialAnimation{
            NumberAnimation {
                id: busyIndicatorBall4SecAni
                property: "x"
                from: 90
                to: from+myBusyIndicator.width
                duration: 750
            }
            NumberAnimation {
                id: busyIndicatorBall3SecAni
                property: "x"
                from:60
                to: from+myBusyIndicator.width
                duration: 750
            }
            NumberAnimation {
                id: busyIndicatorBall2SecAni
                property: "x"
                from:30
                to: from+myBusyIndicator.width
                duration: 750
            }
            NumberAnimation {
                id: busyIndicatorBall1SecAni
                property: "x"
                from:0
                to: from+myBusyIndicator.width
                duration: 750
            }
        }
        loops: Animation.Infinite
    }

    Component.onCompleted: {
        for(let i=0;i<4;i++)
            balls.push(ball.createObject(busyBack,{"x":(i*20+i*10)}))
        for(let j=0;j<4;j++)
        {
            balls[j].x=balls[j].x-(balls[3].x+balls[j].width)
        }
        busyIndicatorBall1FirstAni.target=balls[0]
        busyIndicatorBall2FirstAni.target=balls[1]
        busyIndicatorBall3FirstAni.target=balls[2]
        busyIndicatorBall4FirstAni.target=balls[3]
        busyIndicatorBall1SecAni.target=balls[0]
        busyIndicatorBall2SecAni.target=balls[1]
        busyIndicatorBall3SecAni.target=balls[2]
        busyIndicatorBall4SecAni.target=balls[3]
    }
}
