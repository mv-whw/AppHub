import QtQuick
import AppHub
MyRectangle {
    id: mySelectionCard
    property alias title: mySelectionCardTitle.text
    property alias iconSource: mySelectionCardIcon.sourceLocation
    property real defaultRatioOfIcon: 0.5

    color: MyTheme.button.backgroundColor
    radius: MyTheme.controlCommon.controlRadius

    onWidthChanged: {
        if(mySelectionCardTitle.text!=="" && mySelectionCard.width!==0)
            mySelectionCardTitle.setTxtWidth()
    }

    MyIcon{
        id: mySelectionCardIcon
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        preferedHeight: mySelectionCard.height*0.5
    }
    MyLabel{
        id: mySelectionCardTitle
        anchors.horizontalCenter: mySelectionCard.horizontalCenter
        isBold: true
        y: parent.height-height-5
        elide: MyLabel.ElideRight
        color: "white"

        onTextChanged: {
            if(mySelectionCardTitle.text!=="" && mySelectionCard.width!==0)
                setTxtWidth()
        }
        Component.onCompleted: {
            if(mySelectionCardTitle.text!=="" && mySelectionCard.width!==0)
                setTxtWidth()
        }

        function setTxtWidth(): void
        {
            let wholeWidth=mySelectionCardTitle.implicitWidth
            mySelectionCardTitle.width=(wholeWidth<=(mySelectionCard.width-10)?wholeWidth:(mySelectionCard.width-10))
        }
    }

    MyMouseArea{
        id: mySelectionCardMouse
        onEntered: {
            if(!mySelectionCardAnim.running)
                mySelectionCardAnim.start()
        }
        onExited: {
            if(mySelectionCardAnim.running)
                mySelectionCardAnim.stop()
            mySelectionCard.color=MyTheme.button.backgroundColor
        }

        onPressed: {
            if(mySelectionCardAnim.running)
                mySelectionCardAnim.stop()
            mySelectionCard.color=Qt.darker(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio)
        }
        onReleased: {
            if(isHovered)
                mySelectionCardAnim.start()
            else
                mySelectionCard.color=MyTheme.button.backgroundColor
        }
    }

    SequentialAnimation{
        id: mySelectionCardAnim
        ParallelAnimation{
            ColorAnimation {
                target: mySelectionCard
                property: "color"
                from: MyTheme.button.backgroundColor
                to: Qt.lighter(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio)
                duration: 500
            }

            NumberAnimation {
                target: mySelectionCardIcon
                property: "preferedHeight"
                from: mySelectionCard.height*0.5
                to: mySelectionCard.height*0.55
                duration: 500
            }

        }
        ParallelAnimation{
            ColorAnimation {
                target: mySelectionCard
                property: "color"
                from: Qt.lighter(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio)
                to: MyTheme.button.backgroundColor
                duration: 500
            }

            NumberAnimation {
                target: mySelectionCardIcon
                property: "preferedHeight"
                from: mySelectionCard.height*0.55
                to: mySelectionCard.height*0.5
                duration: 500
            }
        }
        onStopped: mySelectionCardIcon.preferedHeight=mySelectionCard.height*0.5
        loops: Animation.Infinite
    }
}
