import QtQuick
import QtQuick.Controls.Basic
import AppHub
ApplicationWindow {
    id: myAppWindow

    onHeightChanged: SystemAppInfo.windowHeight=myAppWindow.height
    onWidthChanged: SystemAppInfo.windowWidth=myAppWindow.width

    background: MyRectangle{
        color: SystemAppInfo.useDarkMode? Qt.lighter("black",1.2):Qt.darker("white",1.2)//Qt.lighter("lightblue",MyTheme.button.clickHoverRatio)
    }

    Component.onCompleted: {
        if(SystemAppInfo.isWASM)
        {
            //\todo call js function to determinate os type
        }
    }
}
