import QtQuick
import AppHub
Column {
    property var elements: []

    function createElements()
    {

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
