import QtQuick

Rectangle {
    id: myRectangle
    property alias borderColor: myRectangle.border.color
    property alias borderWidth: myRectangle.border.width
    border.color: "white"
    border.width: 0
}
