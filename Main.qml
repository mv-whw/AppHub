import QtQuick
import "./Controls"
import "./DialogComponents"
import "./KoledarComponents"
import "./TabComponents"
import AppHub
MyAppWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Item{
        //spacing: 3
        anchors.centerIn: parent
        width: 100
        height: 480
        // MyButton{text: "open"; onClicked:dd.open()}
        // MyButton{text: "costum d"; onClicked:dd.openWithSelectedCostumDayStamp(2025,10,5)}
        // MyButton{text: "today"; onClicked:dd.openWithSelectedCurrentDay()}

        MyRotatedTab{tabTitle: "IIIItestni r tab long text jeIIII";isOnRightSide: true; anchors.right: parent.right}
        MyRotatedTab{tabTitle: "IIIItestni r tab long text jeIIII"; isOnRightSide: false; anchors.left: parent.left}
        //KolTime{Component.onCompleted: {setTimeUsingTimeString(getCurrentTimeString())}}
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
    MyTimePicker{id: ddd}

}
