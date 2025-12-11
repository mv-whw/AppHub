import QtQuick
import AppHub
MyTab {
    id: myNavTab
    allowTabClosing: false
    readonly property alias isHovered: myNavTabMouse.isHovered

    MyIcon{
        id: myNavTabIcon
        anchors.horizontalCenter: parent.horizontalCenter
        sourceLocation: myNavTab.tabIcon
        height: parent.height*0.65
        colorization: 1.0
        colorizationColor: "white"
        y: 10
    }


    MyLabel{
        id: myNavTabTitle
        anchors.horizontalCenter: parent.horizontalCenter
        fontSize: MyTheme.controlCommon.fontSize-2
        text: myNavTab.tabTitle
        color: "white"
        y: myNavTabIcon.isLoaded? myNavTab.height-myNavTabTitle.implicitHeight-10:myNavTab.height/2-myNavTabTitle.height/2
    }

    MyMouseArea{
        id: myNavTabMouse
        onClicked: {
            if(!myNavTab.isSelected)
            {
                myNavTab.isSelected=true
                myNavTab.clickedOn(myNavTab.tabOwner,myNavTab.mAppName,myNavTab.tabTitle)
            }
        }
    }
}
