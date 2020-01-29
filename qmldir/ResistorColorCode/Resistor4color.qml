import QtQuick 2.0

Item
{

       Text {
            id: resistance4color
            anchors.top: tabSelector_colorCode.bottom
            anchors.bottom: colorResistor4Color.top
            anchors.horizontalCenter: parent.horizontalCenter
            text: ""
       }

        Rectangle
        {
            // TODO: add resistior color stripers
            id: colorResistor4Color
            anchors.topMargin: 30
            anchors.top: parent.top
            height: parent.height / 6
            width: parent.width - parent.width / 4;
            radius: 15
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "black"
            Repeater
            {

                id: colorBands4Color
                model: [[parent.width/20,parent.radius,"A"],
                        [parent.width/20,parent.radius+parent.width/10,"B"],
                        [parent.width/20,parent.radius+parent.width/10*2,"C"],
                        [parent.width/10,parent.width- parent.radius - parent.width/10,"D"]
                ]
            Rectangle
            {
                property alias label: label
                label.text:modelData[2]
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: modelData[0]
                anchors.leftMargin: modelData[1]
                anchors.left: parent.left
                border.color: "black"
                Text {
                    id: label
                    anchors.centerIn: parent
                    text: ""
                }
            }
            }




        }

        Row
        {
            anchors.top: colorResistor4Color.bottom
            anchors.topMargin: 15
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            Repeater
            {
                id: _4colorResistor
                model: ["A","B","C"]
             ColorCodeSelector {
             text: modelData
             width: parent.width/4
             height: parent.height
            }
            }


            ToleraceColorCode {
                id: toleranceColorCode
                text: "D"
                width: parent.width/4
                height: parent.height
            }
        }

    }
