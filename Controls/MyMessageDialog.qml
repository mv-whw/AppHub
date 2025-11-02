import QtQuick
import AppHub
import QtQuick.Controls.Basic
import "../"
import "../DialogComponents"
MyDialog {
    id: myMes
    property alias messageText: myMesMessage.text
    property bool isSet: false
    isOkVisible: true



    Flickable{
        id: mesFlick
        width: parent.width
        contentHeight: myMesMessage.implicitHeight
        MyLabel{
            id: myMesMessage
            wrapMode: MyLabel.WrapAtWordBoundaryOrAnywhere
            width: (myMesMessage.implicitWidth>myMesMessage.parent.width)? myMesMessage.parent.width-20:myMesMessage.implicitWidth
        }
        ScrollBar.vertical: ScrollBar{policy: (mesFlick.contentHeight>mesFlick.height)? ScrollBar.AlwaysOn:ScrollBar.AlwaysOff}
    }

    function setWidthBasedOnContext(): void
    {
        let maxW=Math.min(myMes.parentWidth-20,900)
        let maxHeaderFooter=Math.max(myMes.responseBtnsWidth+20,myMes.dialogHeaderContentWidth)
        let mesConW=myMesMessage.implicitWidth
        let minW=150
        if(maxW>=maxHeaderFooter)
        {
            if(mesConW<=maxW)
            {
                if(mesConW>=maxHeaderFooter)
                    myMes.width=mesConW+20
                else
                    myMes.width=maxHeaderFooter+20
            }
            else//mesConW>maxW
            {
                myMes.width=maxW
                // if(maxW>=maxHeaderFooter)
                //     myMes.width=maxW
                // else
                //     myMes.width=maxW
            }
        }
        else//maxW<maxHeaderFooter
        {
            if(mesConW>=maxW)
            {
                if((myMes.responseBtnsWidth+20)>=maxW)
                    myMes.width=myMes.responseBtnsWidth+20
                else
                    myMes.width=maxW
            }
            else//mesConW<maxW
            {
                if((myMes.responseBtnsWidth+20)>=mesConW)
                    myMes.width=myMes.responseBtnsWidth+20
                else
                    if(mesConW<=maxW)
                    {
                        myMes.width=mesConW+20
                    }else
                        myMes.width=maxW
            }
        }
    }

    function setHeightBasedOnContext(): void
    {
        let maxH=myMes.parentHeight-20
        let maxContent=myMes.headerHeight+(myMes.footerHeight+40)+myMesMessage.height
        if(maxContent<=maxH)
        {
            mesFlick.parent.height=myMesMessage.height
            mesFlick.height=myMesMessage.height
            //myMesMessage.parent.height=myMesMessage.height
        }else//maxContent>maxH
        {
            /*right height*/
            //myMesMessage.parent.height=maxH-(myMes.headerHeight+(myMes.footerHeight+40))
            /*fixed height*/
            //myMesMessage.parent.height=myMesMessage.height
            mesFlick.height=maxH-(myMes.headerHeight+(myMes.footerHeight+40))
            mesFlick.parent.height=mesFlick.height
        }
    }

    onOpened: {
        if(!myMes.isSet)
        {
            myMes.isSet=true
            myMes.setWidthBasedOnContext()
            myMes.setHeightBasedOnContext()
        }
    }

    onDialogTitleTextChanged: {
        if(myMes.isSet)
        {
            myMes.setWidthBasedOnContext()
            myMes.setHeightBasedOnContext()
        }
    }

    onMessageTextChanged: {
        if(myMes.isSet)
        {
            myMes.setWidthBasedOnContext()
            myMes.setHeightBasedOnContext()
        }
    }

    onParentWidthChanged: {
        if(myMes.isSet)
        {
            myMes.setWidthBasedOnContext()
            myMes.setHeightBasedOnContext()
        }
    }

    onParentHeightChanged: {
        if(myMes.isSet)
        {
            myMes.setHeightBasedOnContext()
        }
    }

    onClickedOn: (clickBtn)=>{
                     if(clickBtn==="ok")
                     myMes.close()
                 }
}
