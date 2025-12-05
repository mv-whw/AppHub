import QtQuick
import AppHub
MyTab {
    id: myNavTab
    allowTabClosing: false

    MyIcon{
        id: myNavTabIcon
        anchors.horizontalCenter: parent.horizontalCenter
        sourceLocation: myNavTab.tabIcon
        height: parent.height*0.75
        colorization: 1.0
        colorizationColor: "white"
    }


    MyLabel{
        id: myNavTabTitle
        anchors.horizontalCenter: parent.horizontalCenter
        fontSize: MyTheme.controlCommon.fontSize-2
        text: myNavTab.tabTitle
        color: "white"
        y: myNavTabIcon.isLoaded? myNavTab.height-myNavTabTitle.implicitHeight-10:myNavTab.height/2-myNavTabTitle.height/2
    }
}
