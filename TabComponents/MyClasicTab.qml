import QtQuick
import AppHub
MyTab {
    id: myClasicTab
    property bool isHorizontalType: true
    readonly property bool isHovered: normalTabMouse.isHovered || normalTabCloseBtn.isHovered
    height: MyTheme.controlCommon.controlHeight
    width: myClasicTab.isHorizontalType? MyTheme.tabs.clasicTabHorMinWidth:parent.width

    color: myClasicTab.isSelected? Qt.darker(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio): (myClasicTab.isHovered? Qt.lighter(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio):MyTheme.button.backgroundColor)

    MyIcon{
        id: normalTabIcon
        sourceLocation: myClasicTab.tabIcon
        colorization: 1.0
        colorizationColor: "white"
        preferedHeight: myClasicTab.height/10*8
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
        onClicked: {
            if(!myClasicTab.isSelected)
            {
                myClasicTab.clickedOn(myClasicTab.tabOwner,myClasicTab.mAppName, myClasicTab.tabTitle)
                myClasicTab.isSelected=true
            }
        }
    }

    CloseButton{
        id: normalTabCloseBtn
        x: myClasicTab.width-width-10
        anchors.verticalCenter: parent.verticalCenter
        visible: ((myClasicTab.isSelected || normalTabCloseBtn.isHovered || normalTabMouse.isHovered) && myClasicTab.allowTabClosing)
        onClickedOn:{
            myClasicTab.closeMe(myClasicTab.tabOwner,myClasicTab.mAppName, myClasicTab.tabTitle)
        }
    }
}
