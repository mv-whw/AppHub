import QtQuick
import AppHub
MyTab {
    id: myClasicTab
    property bool isHorizontalType: true

    MyIcon{
        id: normalTabIcon
        sourceLocation: myClasicTab.tabIcon
        colorization: 1.0
        colorizationColor: "white"
        height: myClasicTab.height/10*8
        anchors.verticalCenter: parent.verticalCenter
        x: 10
    }

    MyLabel{
        id: normalTabTitle
        x: (normalTabIcon.isLoaded? 2*normalTabIcon.x+normalTabIcon.width:10)
        width: parent.width-normalTabTitle.x-(normalTabCloseBtn.visible? normalTabCloseBtn.x:0)-10
        anchors.verticalCenter: parent.verticalCenter
        text: myClasicTab.tabTitle
        color: "white"
        elide: MyLabel.ElideRight
    }

    MyMouseArea{
        id: normalTabMouse
        anchors.fill: parent
    }

    CloseButton{
        id: normalTabCloseBtn
        x: myClasicTab.width-width-10
        anchors.verticalCenter: parent.verticalCenter
        visible: ((myClasicTab.isSelected || normalTabCloseBtn.isHovered || normalTabMouse.isHovered) && myClasicTab.allowTabClosing)
    }
}
