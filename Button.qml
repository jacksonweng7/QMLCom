import QtQuick 2.7
import QtQuick.Controls 2.7 as T

T.Button{
    id:root
    text: qsTr("Button")

    property int rectSize: 30
    property string imgUrlPress:""
    property string imgUrlRelease:""
    readonly property alias stytle:stytle


    font {
        family:FlatUI.latoRegularFont.name
        pixelSize: 16
        bold:true
    }

    ButtonStyle{
        id:stytle
        __focused:root.activeFocus
        __hovered:root.containsMouse || root.activeFocus
        __pressed:root.pressed || root.down
        enabled:root.enabled
        icon.font.pixelSize: root.font.pixelSize
    }

    background:Rectangle{
        implicitWidth: 216 //默认宽度
        implicitHeight: 47 // 默认高度
        radius:stytle.radius
        opacity: root.hovered?0.8:1 // 透明度
        color:stytle.color
        Behavior on opacity { NumberAnimation { duration:100}}
        border.color: Qt.darker(stytle.color,1.6)
        border.width: root.focus?0.5:0
    }

    contentItem: Item{
        Row{
            anchors.centerIn: parent
            spacing:8
            Text{ // 图标文本
                id:iconText
                text:stytle.icon.text
                font:style.icon.font
                color:style.icon.color
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width:contentWidth
                height:contentHeight
            }

            Text{ // 显示常规字符
                text:root.text
                font:root.font
                color:stytle.textColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide:Text.ElideRight
            }

            Image{ // 指定Button的图片
                id:image
                visible: imgUrlRelease?true:false
                width:(root.down)?rectSize*0.8 :rectSize
                height:(root.down)?rectSize*0.8:rectSize
                cache:true
                mipmap: true
                source:(root.down || root.checked)?imgUrlPress:imgUrlRelease
                Behavior on width{
                    NumberAnimation{
                        duration: 100
                    }
                }
                Behavior on height{
                    NumberAnimation{
                        duration: 100
                    }
                }
                Behavior on rotation{
                    PropertyAnimation{
                        duration: 500
                    }
                }

            }
        }
    }

    onClicked: {
        if(image.visible){
            // 当点击图片时，图片旋转180°
            image.rotation += 180
        }
    }
}
