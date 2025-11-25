import QtQuick
import AppHub
MyRectangle {
    id: kolDay
    property alias value: kolDayLabel.text
    property color eventColor: Qt.lighter(MyTheme.controlCommon.controlColor,1.5)
    property color colorWithoutEvent: "transparent"
    readonly property bool isNumber: kolDayLabel.text!=="" && !isNaN(kolDayLabel.text)
    readonly property bool isHovered: (kolDay.isNumber && kolDayMouse.isHovered)
    property bool deSelectWithClick: true//false
    property bool isSelected: false
    property bool isCurrentDay: false
    property bool hasEvent: false
    signal selected()
    onIsSelectedChanged: {
        if(kolDay.isSelected)
            kolDay.selected()
    }

    color: kolDay.hasEvent? kolDay.eventColor: kolDay.colorWithoutEvent
    borderColor: "black"
    borderWidth: (kolDay.isSelected? (MyTheme.controlCommon.controlBorderWidth+1): (kolDay.isNumber? (kolDay.isHovered? MyTheme.controlCommon.controlBorderWidth:0):0))

    MyLabel{
        id: kolDayLabel
        anchors.centerIn: parent
        fontSize: (kolDay.isNumber? 2:0)+ MyTheme.controlCommon.fontSize
        isBold: kolDay.isCurrentDay || !kolDay.isNumber
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
