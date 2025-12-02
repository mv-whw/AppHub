pragma Singleton
import QtQuick

QtObject {
    property string appName: "AppHub"
    property string appVersion: "0.0.1"

    property bool isWindows: Qt.platform.os==="windows"
    property bool isLinux: Qt.platform.os==="linux"
    property bool isMacOs: Qt.platform.os==="osx"

    property bool isAndroid: Qt.platform.os==="android"
    property bool isIos: Qt.platform.os==="ios"
    property bool isWASM: Qt.platform.os==="wasm"

    readonly property bool isMobile: isAndroid||isIos
    readonly property bool isDesktop: isWindows||isMacOs||isLinux

    property bool useDarkMode: false

    property bool startWeekWithSunday: false

    property real windowWidth: 640
    property real windowHeight: 480
}
