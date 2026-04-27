import QtQuick

Item{

    id:leftpage
    property bool hovered: leftPageMouseArea.containsMouse
    MouseArea{
        id:leftPageMouseArea
        hoverEnabled: true
        anchors.fill: parent
    }

    Behavior on width{
        NumberAnimation{
            duration: 250
            easing.type: Easing.InQuad
        }
    }

    width:leftPageMouseArea.containsMouse ? 200:50

    Rectangle{
        color:"pink"
        anchors.fill: parent
        antialiasing: true
        topLeftRadius:20
        bottomLeftRadius:20
    }

}
