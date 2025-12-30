import QtQuick
import AppHub
Column {
    id: myRegView
    property var elements: []

    function createElements()
    {
        let n=myRegView.children.length
        if(n!==0)
            for(n;n!==0;n--)
                myRegView.children[(n-1)].destroy()
        let elem;
        for(let i=0;i<elements.length;i++)
        {
            elem=elements[i].split(':')

        }
    }

    Component{
        id: txtF
        MyTextField{}
    }

    Component{
        id: txt
        MyLabel{

        }
    }

    Component{
        id: swi
        MySwitch{

        }
    }

    Component{
        id: btn
        MyButton{

        }
    }
}
