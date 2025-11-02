import QtQuick
import QtQuick.Controls.Basic
//import AppHub
import "../"
import "../BasicComponents"
Row {
    id: myTextFieldRow
    property alias text: myTextField.text
    property alias placeholderText: myTextField.placeholderText
    property alias useForPassword: myTextField.isPassword
    property alias selectedText: myTextField.selectedText
    property alias selectionStart: myTextField.selectionStart
    property alias selectionEnd: myTextField.selectionEnd

    TextField{
        id: myTextField
        property bool isPassword: false
        width: myTextFieldRow.width-(myTextFieldActionButton.visible? myTextFieldActionButton.width:0)
        hoverEnabled:true
        passwordMaskDelay: 200
        selectByMouse: true
        font.pointSize: MyTheme.controlCommon.fontSize
        placeholderTextColor: MyTheme.textFieldArea.placeholderColor
        selectionColor: MyTheme.textFieldArea.selectionColor
        selectedTextColor: MyTheme.textFieldArea.selectedTextColor
        color: MyTheme.textFieldArea.textColor


        background: MyRectangle{
            implicitHeight: MyTheme.controlCommon.controlHeight
            topLeftRadius: MyTheme.controlCommon.controlRadius
            bottomLeftRadius: MyTheme.controlCommon.controlRadius
            topRightRadius: myTextFieldActionButton.visible? 0.0: MyTheme.controlCommon.controlRadius
            bottomRightRadius: myTextFieldActionButton.visible? 0.0: MyTheme.controlCommon.controlRadius
            color: MyTheme.textFieldArea.backgroundColor
            borderWidth: (myTextField.focus || myTextField.hovered || myTextFieldActionEvents.isHovered)? MyTheme.controlCommon.controlBorderWidth*MyTheme.controlCommon.controlBorderRatio:MyTheme.controlCommon.controlBorderWidth
            borderColor: myTextField.focus? MyTheme.controlCommon.controlColor: ((myTextField.hovered || myTextFieldActionEvents.isHovered)? Qt.lighter(MyTheme.controlCommon.controlColor,MyTheme.controlCommon.clickedHoverColorRatio):"black")
        }
        onIsPasswordChanged: {
            myTextField.echoMode=myTextField.isPassword? TextField.Password:TextField.Normal
        }
    }
    MyRectangle{
        id: myTextFieldActionButton
        height: myTextField.height
        width: height
        visible: myTextField.text!==""
        color: myTextFieldActionEvents.pressed? Qt.darker(MyTheme.controlCommon.controlColor,MyTheme.controlCommon.clickedHoverColorRatio):(myTextFieldActionEvents.isHovered? Qt.lighter(MyTheme.controlCommon.controlColor,MyTheme.controlCommon.clickedHoverColorRatio):MyTheme.controlCommon.controlColor)
        topRightRadius: MyTheme.controlCommon.controlRadius
        bottomRightRadius: MyTheme.controlCommon.controlRadius
        MyIcon{
            anchors.centerIn: parent
            height: parent.height*0.8
            sourceLocation: myTextFieldRow.useForPassword? (myTextField.echoMode===TextField.Password? "qrc:/qt/qml/AppHub/Icons/visibility_off.svg":"qrc:/qt/qml/AppHub/Icons/visibility.svg"):"qrc:/qt/qml/AppHub/Icons/delete.svg"
            colorization: 1.0
            colorizationColor: "white"
        }

        MyMouseArea{
            id: myTextFieldActionEvents
            onClicked: {
                if(!myTextFieldRow.useForPassword)
                    myTextField.text=""
                else
                {
                    if(myTextField.echoMode===TextField.Password)
                        myTextField.echoMode=TextField.Normal
                    else
                        myTextField.echoMode=TextField.Password
                }
                myTextField.focus=true
            }
        }
    }
}
