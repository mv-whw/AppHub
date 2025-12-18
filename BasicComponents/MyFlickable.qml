import QtQuick
import QtQuick.Controls.Basic
Flickable {
    id: myFlickable
    ScrollIndicator.vertical: ScrollIndicator{visible: myFlickable.contentHeight>myFlickable.height}
    ScrollIndicator.horizontal: ScrollIndicator{visible: myFlickable.contentWidth>myFlickable.width}
}
