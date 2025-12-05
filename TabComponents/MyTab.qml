import QtQuick
import AppHub

MyRectangle {
    property string tabIcon: ""
    property string tabTitle: ""
    property string tabOwner: ""
    property bool allowTabHiding: true
    property bool allowTabClosing: true
    property bool isSelected: false
    signal closeMe(owner: string, title: string)
    signal clickedOn(owner: string, title: string)
}
