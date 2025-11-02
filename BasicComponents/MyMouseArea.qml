import QtQuick

MouseArea {
    id: myMouseArea
    property bool isHovered: false
    anchors.fill: parent
    hoverEnabled: true
    onEntered: {
        if(!myMouseArea.isHovered)
            myMouseArea.isHovered=true
    }
    onExited: {
        if(myMouseArea.isHovered)
            myMouseArea.isHovered=false
    }
}
