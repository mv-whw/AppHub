import QtQuick
import "./Controls"
import "./DialogComponents"
import "./KoledarComponents"
import "./TabComponents"
import "./BasicComponents"
import AppHub
MyAppWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Column{
        //spacing: 3
        anchors.centerIn: parent
        width: 400
        height: 480
        //MySelectionCard{width: 120;height: 120; title: "test"; iconSource: MyIconType.getIconPath("test")}
        MyChooseCardsView{
            width: parent.width
            height: parent.height
            Component.onCompleted: {
                addComponentToView("test",MyIconType.getIconPath("test"),true)
                addComponentToView("upload",MyIconType.getIconPath("upload"),true)
            }
        }

        //MyChooseButton{width: 200; height: 200;title:"testna"; iconSource: MyIconType.getIconPath("test")}
        //MyButton{text: "warning"; onClicked:{d.dialogType="warning"; d.open()}}


        //MyButton{text: "info"; onClicked: {d.dialogType="info"; d.open()}}
        //MyButton{text: "errror"; onClicked: {d.dialogType="error"; d.open()}}
        //MyButton{text: "question"; onClicked: {d.dialogType="question"; d.open()}}
        // MyButton{text: "costum d"; onClicked:dd.openWithSelectedCostumDayStamp(2025,10,5)}
        // MyButton{text: "today"; onClicked:dd.openWithSelectedCurrentDay()}

        //MyRotatedTab{tabTitle: "IIIItestni r tab long text jeIIII";isOnRightSide: true; anchors.right: parent.right}
        //MyRotatedTab{tabTitle: "IIIItestni r tab long text jeIIII"; isOnRightSide: false; anchors.left: parent.left}
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
    // MyChooseButton{width: 120;height: 120; title: "test"; iconSource: MyIconType.getIconPath("test")}
    // MyChooseCardsView{
    //     width: parent.width
    //     height: parent.height
    //     Component.onCompleted: {
    //         addComponentToView("test",MyIconType.getIconPath("test"),true)
    //     }
    // }
    MyMessageDialog{id: d;dialogTitleText: "testna"; dialogType: "info";messageText: "to je moj testing tekst ki se se mora preh dhio hida"; width: 200;isOkVisible: true}


    // MyIcon{
    //     sourceLocation: MyIconType.getIconPath("upload")
    //     colorizationColor: "black"
    //     colorization: 1.0
    //     preferedHeight: 50
    // }


    // Component.onCompleted: {
    //     console.log(MyIconType.getAllNames())
    // }
}
