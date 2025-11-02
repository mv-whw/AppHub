import QtQuick
import "./Controls"
import "./DialogComponents"
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column{
        MyButton{text: "test"; onClicked:d.open()}
        MySwitch{checked: false}
        MySwitch{checked: true}
        MySlider{from: 0; to: 100; value: 20; width: 300; stepSize: 2}
        MyRangeSlider{from: 0; to: 100; first.value: 20;stepSize: 2; second.value: 70; width: 300}
        MyProgressBar{progresValue: 100; width: 300; detailsText: ""}

    }
    MyMessageDialog{id: d;dialogTitleText: "testna"; dialogType: "info";messageText: "to je moj testing tekst ki se mora deliti na vec delov in pofka"; width: 200;isOkVisible: true}

}
