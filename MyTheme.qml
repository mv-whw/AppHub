pragma Singleton
import QtQuick
import "./ComponentsSettings"
//import AppHub
QtObject {
    property MyControlsCommonTheme controlCommon: MyControlsCommonTheme{}
    property MyButtonTheme button: MyButtonTheme{}
    property MyTextFieldAreaTheme textFieldArea: MyTextFieldAreaTheme{}
    property MyFrameGroupBoxTheme frameGroupBox: MyFrameGroupBoxTheme{}
}
