import QtQuick 2.15
import QtQuick.Window

Item {

    id:functionButton
    property bool isMaximized : functionButton.Window.window.visibility===Window.Maximized

    Row{
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 10
        anchors.rightMargin: 25
        spacing: 6
        Item{
            width: 25
            height: 25

            Rectangle{
                anchors.fill: parent
                color: minimizearea.containsMouse?"#40000000":"transparent"
            }
            Image{
                id:minimize
                width: 20
                height: 20
                anchors.centerIn: parent
                source:"qrc:/new/prefix1/minimizeButton.png"
            }

            MouseArea{
                id:minimizearea
                anchors.fill: parent
                onClicked: functionButton.Window.window.showMinimized()
                hoverEnabled: true

            }
        }

        Item{
            width: 25
            height: 25
            Rectangle{
                anchors.fill: parent
                color: maximizearea.containsMouse?"#40000000":"transparent"
            }
            Image{
                id:maximize
                width: isMaximized ? 16:20
                height: isMaximized ? 16:20
                anchors.centerIn: parent
                source:isMaximized ? "qrc:/new/prefix1/restoreButton.png":"qrc:/new/prefix1/maximizeButton.png"
            }

            MouseArea{
                id:maximizearea
                anchors.fill: parent
                onClicked:{
                    if (functionButton.Window.window.visibility === Window.Maximized){
                        functionButton.Window.window.showNormal()
                    }else{
                        functionButton.Window.window.showMaximized()
                    }
                }

                hoverEnabled: true

            }


        }

        Item{
            width: 25
            height: 25
            Image{
                id:closea
                width: 15
                height: 15
                anchors.centerIn: parent
                source:"qrc:/new/prefix1/closeButton.png"
            }



            Rectangle{
                anchors.fill: parent
                color: closearea.containsMouse?"#40000000":"transparent"
            }
            MouseArea{
                id:closearea
                anchors.fill: parent
                onClicked: functionButton.Window.window.close()
                hoverEnabled: true

            }
        }

    }
}
