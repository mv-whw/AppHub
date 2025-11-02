import QtQuick

Image {
    id: myImage
    readonly property bool isLoaded: (myImage.source!=="" && myImage.status===Image.Ready)
    fillMode: Image.PreserveAspectFit
    visible: myImage.isLoaded
}
