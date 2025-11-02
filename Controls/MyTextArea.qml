import QtQuick
import QtQuick.Controls.Basic
//import AppHub
import "../"
import "../BasicComponents"
ScrollView{
    id: myTextAreaScrolView
    property alias text: myTextArea.text
    property alias placeholderText: myTextArea.placeholderText
    property alias selectedText: myTextArea.selectedText
    property alias selectionStart: myTextArea.selectionStart
    property alias selectionEnd: myTextArea.selectionEnd
    property alias isFocused: myTextArea.focus
    property int maxLines: 5
    property alias textAreaTopPadding: myTextArea.topPadding
    property alias textAreaBottomPadding: myTextArea.bottomPadding
    hoverEnabled: true
    height:(myTextArea.lineCount===1? 48:(myTextArea.lineCount<myTextAreaScrolView.maxLines? myTextArea.contentHeight: (myTextArea.contentHeight/myTextArea.lineCount)*myTextAreaScrolView.maxLines)+(myTextArea.bottomPadding+myTextArea.topPadding))

    TextArea{
        id: myTextArea
        background: MyRectangle{
            radius: MyTheme.controlCommon.controlRadius
            color: MyTheme.textFieldArea.backgroundColor
            borderWidth: myTextArea.focus? (MyTheme.controlCommon.controlBorderWidth*MyTheme.controlCommon.controlBorderRatio):MyTheme.controlCommon.controlBorderWidth
            borderColor: myTextArea.focus? MyTheme.controlCommon.controlColor:(myTextAreaScrolView.hovered? Qt.lighter(MyTheme.controlCommon.controlColor,MyTheme.controlCommon.clickedHoverColorRatio): "black")
        }
        onEditingFinished: myTextArea.focus=false
        topPadding: myTextArea.lineCount===1? 10:5
        bottomPadding: 5
        selectByKeyboard: true
        selectByMouse: true
        selectionColor: MyTheme.textFieldArea.selectionColor
        selectedTextColor: MyTheme.textFieldArea.selectedTextColor
        placeholderTextColor: MyTheme.textFieldArea.placeholderColor
        font.pointSize: MyTheme.controlCommon.fontSize
        color: MyTheme.textFieldArea.textColor
    }
}
