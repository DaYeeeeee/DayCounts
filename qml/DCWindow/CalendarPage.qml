import QtQuick 2.15

Item {
    id:calendarpage
    property var today: new Date()
    property int showyear: today.getFullYear()
    property int showmonth: today.getMonth()
    property int selectday: today.getDate()
    readonly property var weekname: ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    readonly property int dayInMonth: new Date(showyear,showmonth+1,0).getDate()
    readonly property int firstday_weekname: new Date(showyear,showmonth,1).getDay()

    function monthChanged(add){
        var tday = new Date(showyear,showmonth+add,1)
        showyear = tday.getFullYear()
        showmonth = tday.getMonth()
    }

    Column{
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 50
        spacing:10

        Grid{
            id:thisweekname
            columns: 7
            spacing: 10
            Repeater{
                model: weekname
                Rectangle{
                    width: 50
                    height: 20
                    radius:4
                    color: "transparent"
                    Text{
                        anchors.centerIn: parent
                        text: modelData
                        color:"white"
                        font.bold: true
                        font.pixelSize: 20
                    }
                }
            }
        }

        Grid{
            id: thisday

            columns: 7
            spacing: 10
            Repeater{
                model: 42
                delegate:
                    Rectangle{
                    required property int index
                    readonly property int daynumber: index - firstday_weekname + 1
                    readonly property bool isCurrentMonth: daynumber > 0 && daynumber <=dayInMonth
                    width: 50
                    height:50
                    radius:4
                    color:isCurrentMonth ? "white":"blue"

                    Text{
                        anchors.centerIn: parent
                        text:isCurrentMonth ? daynumber:""

                    }

                    MouseArea{
                        anchors.fill: parent
                        enabled: isCurrentMonth
                        onClicked: selectday = daynumber
                    }
                }



            }

        }
    }


}
