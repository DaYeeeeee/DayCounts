import QtQuick 2.15
import QtQuick.Window 2.15

Window{
    height: 800
    width: 1280
    color:"transparent"
    visible:true
    title: qsTr("DayConuts")

    Rectangle{
        color: "#FFA8D8FF"
        radius: 20
        anchors.fill: parent
        clip:true

        LeftPage{
            id:leftpage
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }

        Item{
            id:mainarea
            anchors.left: leftpage.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Rectangle{
                anchors.fill: parent
                id:hoverdarker
                z:100
                color:"#40000000"
                opacity: leftpage.hovered ? 1:0
                Behavior on opacity {
                    NumberAnimation{
                        duration: 250
                    }
                }
            }
        }
    }



    TitleButton{
        id:title_triple
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        height:30

    }

    CalendarPage{
        anchors.leftMargin: 70
        anchors.topMargin: 40
    }



    Component.onCompleted: {
        x = (Screen.desktopAvailableWidth-width)/2
        y = (Screen.desktopAvailableHeight-height)/2
    }
}
