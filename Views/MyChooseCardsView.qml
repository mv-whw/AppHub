import QtQuick
import QtQuick.Controls.Basic
import AppHub

Flow{
    id: myChooseCardsView
    property real minWidthOfComponents: 120
    property real sizeOfComponents: 120

    onWidthChanged: {
        myChooseCardsView.calculateSizeComponents()
        myChooseCardsView.resizeComponents()
    }

    function addComponentToView(title: string, icon:string, resizeAfter:bool)
    {
        chooseBtnComponent.createObject(myChooseCardsView,{"title":title,
                                            "iconSource": icon})
        if(resizeAfter)
            myChooseCardsView.resizeComponents()
    }

    function calculateSizeComponents()
    {
        let vWidth=myChooseCardsView.width
        let space=myChooseCardsView.spacing
        let minWidth=myChooseCardsView.minWidthOfComponents
        let nComponents=vWidth/minWidth
        vWidth=nComponents*(minWidth+((nComponents-1)*space))
        if(vWidth>myChooseCardsView.width)
        {
            nComponents--
            vWidth=nComponents*(minWidth+((nComponents-1)*space))
        }
        if(nComponents<1)
        {
            nComponents=1
            minWidth=myChooseCardsView.width
        }
        else
        {
            let dW=myChooseCardsView.width-vWidth
            minWidth+=(dW/nComponents)
        }
        myChooseCardsView.sizeOfComponents=minWidth
    }

    function resizeComponents():void
    {
        for(let i=0;i< myChooseCardsView.children.length;i++)
        {
            myChooseCardsView.children[i].width=myChooseCardsView.sizeOfComponents
            myChooseCardsView.children[i].height=myChooseCardsView.sizeOfComponents
        }
    }

    Component{
        id: chooseBtnComponent
        MySelectionCard{

        }
    }
}
