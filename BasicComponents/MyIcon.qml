import QtQuick
import QtQuick.Effects
Item {
    id: myIcon
    property alias colorization: myIconEffect.colorization
    property alias colorizationColor: myIconEffect.colorizationColor
    property alias sourceLocation: myIconImage.source
    readonly property alias isLoaded: myIconImage.isLoaded
    visible: myIcon.isLoaded

    onWidthChanged: {
        if(myIcon.width!==myIconImage.width)
            myIconImage.width=myIcon.width
    }
    onHeightChanged: {
        if(myIcon.height!==myIconImage.height)
            myIconImage.height=myIcon.height
    }

    MyImage{
        id: myIconImage
        visible: parent.colorization===0.0
        onWidthChanged: {
            if(myIcon.width!==myIconImage.width)
                myIcon.width=myIconImage.width
        }
        onHeightChanged: {
            if(myIcon.height!==myIconImage.height)
                myIcon.height=myIconImage.height
        }
    }
    MultiEffect{
        id: myIconEffect
        visible: parent.colorization!==0.0
        source: myIconImage
        anchors.fill: parent
    }
}
