import QtQuick 2.0

Item
{
    id: item1

       Text {
            id: resistance5color
            anchors.top: tabSelector_colorCode.bottom
            anchors.bottom: colorResistor5Color.top
            anchors.horizontalCenter: parent.horizontalCenter
            text: ""
       }

        Rectangle
        {
            // TODO: add resistior color  bands
            id: colorResistor5Color
            anchors.topMargin: 30
            anchors.top: parent.top
            height: parent.height / 6
            width: parent.width - parent.width / 4;
            radius: 15
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "black"

            Repeater
            {

                id: colorBands5Color
                model: [[parent.width/20,parent.radius,"A"],
                        [parent.width/20,parent.radius+parent.width/10,"B"],
                        [parent.width/20,parent.radius+parent.width/10*2,"C"],
                        [parent.width/20,parent.radius+parent.width/10*3,"D"],
                        [parent.width/10,parent.width- parent.radius - parent.width/10,"F","#a0522d"]
                ]
            Rectangle
            {
                property alias label: label
                label.text:modelData[2]
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: modelData[0]
                anchors.leftMargin: modelData[1]
                color: if  (modelData[3])
                       {
                           return modelData[3]
                       }

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
            anchors.top: colorResistor5Color.bottom
            anchors.topMargin: 15
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            Repeater
            {
                id: _5colorResistor
                model: ["A","B","C","D"]
             ColorCodeSelector {
             text: modelData
             width: parent.width/4
             height: parent.height
            }
            }

        }

    }

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
