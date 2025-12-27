import QtQuick
import QtQuick.Effects
Item {
    id: myIcon
    property alias colorization: myIconEffect.colorization
    property alias colorizationColor: myIconEffect.colorizationColor
    property alias sourceLocation: myIconImage.source
    readonly property alias isLoaded: myIconImage.isLoaded
    property alias ratio: myIconImage.ratio
    property alias useSourceSize: myIconImage.useSourceSize
    readonly property alias originalSize: myIconImage.sourceSize
    property alias preferedHeight: myIconImage.preferedHeight
    visible: myIcon.isLoaded

    MyImage{
        id: myIconImage
        visible: parent.colorization===0.0

        onWidthChanged: {
            myIcon.width=myIconImage.width
        }
        onHeightChanged: {
            myIcon.height=myIconImage.height
        }
    }
    MultiEffect{
        id: myIconEffect
        visible: parent.colorization!==0.0
        source: myIconImage
        anchors.fill: parent
    }

    onIsLoadedChanged: {
        if(myIcon.isLoaded)
        {
            myIconImage.height=myIcon.preferedHeight
            myIconImage.width=myIcon.width
            myIcon.height=myIconImage.height
        }
    }
}
