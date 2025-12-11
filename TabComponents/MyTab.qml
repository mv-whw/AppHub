import QtQuick
import AppHub

MyRectangle {
    property string tabIcon: ""
    property string tabTitle: ""
    property string tabOwner: ""
    property string mAppName: ""
    property bool allowTabHiding: true
    property bool allowTabClosing: true
    property bool isSelected: false
    signal closeMe(owner: string, microAppName:string, title: string)
    signal clickedOn(owner: string, microAppName:string, title: string)



    //\todo hide appowner and mappname from UI
}
