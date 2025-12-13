import QtQuick
import AppHub
MyTab {
    id: myRotatedTab
    property bool isOnRightSide: false
    readonly property alias isHovered: myRotatedTabMouse.isHovered

    bottomLeftRadius: myRotatedTab.isOnRightSide? MyTheme.controlCommon.controlRadius:0.0
    topLeftRadius: myRotatedTab.isOnRightSide? MyTheme.controlCommon.controlRadius:0.0
    bottomRightRadius: !myRotatedTab.isOnRightSide? MyTheme.controlCommon.controlRadius:0.0
    topRightRadius:  !myRotatedTab.isOnRightSide? MyTheme.controlCommon.controlRadius:0.0
    width: MyTheme.controlCommon.controlHeight
    height: 150
    color: myRotatedTab.isSelected? Qt.darker(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio): (myRotatedTab.isHovered? Qt.lighter(MyTheme.button.backgroundColor,MyTheme.button.clickHoverRatio):MyTheme.button.backgroundColor)



    MyLabel{
        id: myRotatedTabText
        text: myRotatedTab.tabTitle
        elide: MyLabel.ElideRight
        color: "white"
        x:0
        width: myRotatedTab.height-2*MyTheme.controlCommon.controlRadius
        transform: [
            Rotation{
                origin.x: myRotatedTab.isOnRightSide? myRotatedTab.height/2: 14
                origin.y: myRotatedTab.isOnRightSide? myRotatedTabText.width-myRotatedTab.height/2+8 : myRotatedTabText.height-6
                angle: myRotatedTab.isOnRightSide? 270: 90
            }

        ]
    }
    MyMouseArea{
        id: myRotatedTabMouse
        onClicked: {
            if(!myRotatedTab.isSelected)
            {
                myRotatedTab.isSelected=true
                myRotatedTab.clickedOn(myRotatedTab.tabOwner,myRotatedTab.mAppName,myRotatedTab.tabTitle)
            }
        }
    }
}
