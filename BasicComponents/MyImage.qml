import QtQuick

Image {
    id: myImage
    readonly property bool isLoaded: (myImage.source!=="" && myImage.status===Image.Ready)
    readonly property bool isLoading: myImage.status===Image.Loading
    visible: myImage.isLoaded
    readonly property bool useSourceSize: myImage.ratio===1.0
    property real ratio: 5.0
    property real preferedHeight: 50
    onPreferedHeightChanged: {
        myImage.ratio=myImage.preferedHeight/myImage.sourceSize.height
    }

    onIsLoadedChanged: {
        if(myImage.isLoaded)
        {
            myImage.ratio=myImage.preferedHeight/myImage.sourceSize.height


            let imageSize=myImage.sourceSize
            if(myImage.useSourceSize)
            {
                myImage.width=imageSize.width
                myImage.height=imageSize.height
            }else
            {
                myImage.width=imageSize.width*myImage.ratio
                myImage.height=imageSize.height*myImage.ratio
            }
        }
    }

    onHeightChanged: {
        let imageSize=myImage.sourceSize
        if(myImage.height!== imageSize.height*myImage.ratio)
            myImage.height=imageSize.height*myImage.ratio
    }

    onWidthChanged: {
        let imageSize=myImage.sourceSize
        if(myImage.width!== imageSize.width*myImage.ratio)
            myImage.width=imageSize.width*myImage.ratio
    }

    onRatioChanged: {
        let imageSize=myImage.sourceSize
        myImage.width=imageSize.width*myImage.ratio
        myImage.height=imageSize.height*myImage.ratio
    }
}
