import QtQuick
import AppHub
MyRectangle {
    id: kolDay
    property alias value: kolDayLabel.text
    property alias valueColor: kolDayLabel.color
    readonly property bool isNumber: !isNaN(kolDayLabel.text)
    readonly property bool isHovered: (kolDay.isNumber && kolDayMouse.isHovered)
    property bool deSelectWithClick: false
    property bool isSelected: false

    MyLabel{
        id: kolDayLabel
        anchors.centerIn: parent
        fontSize: MyTheme.controlCommon.fontSize+2
    }

    MyMouseArea{
        id: kolDayMouse
        onClicked: {
            if(kolDay.isNumber)
            {
                if(!kolDay.isSelected)
                    kolDay.isSelected=true
                else
                    if(kolDay.deSelectWithClick)
                        kolDay.isSelected=false
            }
        }
    }
}
