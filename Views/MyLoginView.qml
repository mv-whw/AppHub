import QtQuick
import AppHub
Column{
    id: logView
    signal clickedOn(sucess: bool)
    signal errorOn(text: string)
    MyLabel{text:qsTr("up. ime:");x:10}
    MyTextField{id: uName; useForPassword:false; width:logView.width}
    MyLabel{text:qsTr("geslo:");x:10}
    MyTextField{id: uPass; useForPassword:true; width:logView.width}
    MyButton{
        text:qsTr("Prijava")
        onClicked: {
            if(uName.text==="" || uPass.text==="")
                logView.errorOn(qsTr("uporabniško ime in ali geslo mora biti vnešeno!!!!!!"))
            else
            {
                //\todo if(login not success)

            }
        }
    }
}
