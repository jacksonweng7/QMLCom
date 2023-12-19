import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Row{
        spacing: 2
        ImageButton{
            imgUrlPress:"qrc:/flatUI/img/images/setting_1.png"
            imgUrlRelease:"qrc:/flatUI/img/images/setting_2.png"
        }
    }
}
