import QtQuick
import "./Controls"
import "./DialogComponents"
import "./KoledarComponents"
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column{
        MyButton{text: "test"; onClicked:dd.open()}
        /*MySwitch{checked: false}
        MySwitch{checked: true}
        MySlider{from: 0; to: 100; value: 20; width: 300; stepSize: 2}
        MyRangeSlider{from: 0; to: 100; first.value: 20;stepSize: 2; second.value: 70; width: 300}
        MyProgressBar{progresValue: 100; width: 300; detailsText: ""}*/
        // KolMonthView{
        //     width: 330
        // }

    }
    MyMessageDialog{id: d;dialogTitleText: "testna"; dialogType: "info";messageText: "to je moj testing tekst ki se se mora preh dhio hida"; width: 200;isOkVisible: true}
    MyDayPicker{id: dd}

}
