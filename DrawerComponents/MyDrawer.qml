import QtQuick
import QtQuick.Controls.Basic
import AppHub
Drawer {
    id: myDrawer
    property bool isOnLeft: true
    edge: myDrawer.isOnLeft? Qt.LeftEdge:Qt.RightEdge
    width: SystemAppInfo.windowWidth<250? 100:230
    dragMargin: 0

    background: MyRectangle{
        bottomLeftRadius: myDrawer.isOnLeft? 0.0:MyTheme.controlCommon.controlRadius
        topLeftRadius: myDrawer.isOnLeft? 0.0: MyTheme.controlCommon.controlRadius
        bottomRightRadius: myDrawer.isOnLeft? MyTheme.controlCommon.controlRadius:0.0
        topRightRadius: myDrawer.isOnLeft? MyTheme.controlCommon.controlRadius:0.0
        borderWidth: MyTheme.controlCommon.controlBorderWidth
        borderColor: MyTheme.button.backgroundColor
        color: Qt.lighter(MyTheme.button.backgroundColor, 1.4)
    }
}
