import QtQuick
import QtQuick.Controls.Basic
import AppHub
Popup {
    id: myD

    property alias dialogType: myDHeaderIcon.iconType
    property alias dialogTitleText: myDHeaderLabel.text
    readonly property real dialogIconWidth: myDHeaderIcon.visible? myDHeaderIcon.width:0
    readonly property real dialogTitleTextWidth: (myDHeaderLabel.width>myDHeaderLabel.implicitWidth? myDHeaderLabel.implicitWidth:myDHeaderLabel.width)
    readonly property real dialogHeaderContentWidth: (2*MyTheme.controlCommon.controlRadius+(myDHeaderIcon.visible? myDHeaderIcon.width+10:0)+myDHeaderLabel.implicitWidth)
    readonly property alias dialogHeaderWidth: myDHeader.width
    readonly property alias headerHeight: myDHeader.height
    readonly property alias footerHeight: resBtn.height
    readonly property alias responseBtnsWidth: resBtn.width
    property alias isOkVisible: resBtn.isOkVisible
    property alias isYesVisible: resBtn.isYesVisible
    property alias isNoVisible: resBtn.isNoVisible
    property alias isApplyVisible: resBtn.isApplyVisible
    property alias isCancelVisible: resBtn.isCancelVisible
    property alias isRetryVisible: resBtn.isRetryVisible
    default property alias myFlickChildren: myDFlickable.children
    readonly property real parentWidth: myD.parent.width
    readonly property real parentHeight: myD.parent.height

    signal clickedOn(btnName: string)
    spacing: 0.0
    padding: 0.0

    background: MyRectangle{
        radius: MyTheme.controlCommon.controlRadius
        color: "lightblue"

        Column{
            id: myDbackCol
            spacing: 10
            bottomPadding: 10
            width: parent.width
            MyRectangle{
                id: myDHeader
                color:  "dodgerblue"
                width: parent.width
                height: 48
                topLeftRadius: MyTheme.controlCommon.controlRadius
                topRightRadius: MyTheme.controlCommon.controlRadius

                DialogHeaderIcon{
                    id: myDHeaderIcon
                    x: MyTheme.controlCommon.controlRadius
                    anchors.verticalCenter: parent.verticalCenter
                }
                MyLabel{
                    id: myDHeaderLabel
                    x: myDHeaderIcon.visible? myDHeaderIcon.x+myDHeaderIcon.width+10:MyTheme.controlCommon.controlRadius
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                    elide: MyLabel.ElideRight
                    width: parent.width-(MyTheme.controlCommon.controlRadius*2)-(myDHeaderIcon.visible? 10+myDHeaderIcon.width:0)
                }

                MyMouseArea{
                    property bool isPressed: false
                    property point dxy
                    onPressed: (mouse)=>{
                                   isPressed=true
                                   cursorShape= Qt.ClosedHandCursor
                                   dxy=myDHeader.mapFromItem(parent,mouse.x,mouse.y)
                               }
                    onReleased: {
                        if(isPressed)
                        {
                            isPressed=false
                            cursorShape=Qt.ArrowCursor
                        }
                    }

                    onMouseXChanged: {
                        if(isPressed)
                        {
                            let nX=myD.x+(mouseX-dxy.x)
                            if(nX>=0 && nX<(myD.parent.width-myD.width))
                                myD.x=nX
                        }
                    }
                    onMouseYChanged: {
                        if(isPressed)
                        {
                            let nY=myD.y+(mouseY-dxy.y)
                            if(nY>=0 && nY<(myD.parent.height-myD.height))
                                myD.y=nY
                        }
                    }
                }

            }//end header

            // ScrollView{
            //     id: myDFlickable
            //     clip: true
            //     anchors.horizontalCenter: parent.horizontalCenter
            //     width: parent.width-20
            // }

            Item{
                id: myDFlickable
                clip: true
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width-20
                //flickableDirection: Flickable.VerticalFlick
            }

            ResponceButtons{
                id: resBtn
                y: parent.height-resBtn.height-10
                x: parent.width-resBtn.width-10
                onClickedOn: (btnName)=>{
                                 myD.clickedOn(btnName)
                             }
            }
        }
    }
    height: myDbackCol.height
}
