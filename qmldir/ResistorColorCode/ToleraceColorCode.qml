import QtQuick 2.0
import "ColorCodeFunctions.js" as ColorCodeJS

Column
    {
        property alias text: label.text
        Rectangle
        {
          height: parent.height/11
          width: parent.width;
          Text {
              id: label
              anchors.centerIn: parent
              text:"Text"
          }
        }

        property var toleranceColors: ["#a0522d","#ff0000","#ffff00","#b6b6b6","#ff5454"]
        property int selectedColor: -1;
        property var tolerance: [1,2,5,10,20]

        Repeater
        {
            model: 5
            Rectangle
            {
                height: 2*parent.height/11
                width: parent.width;
                color: toleranceColors[modelData];
                border.color: "white"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: function fun()
                    {
                        selectedColor = ColorCodeJS.getNumerator(toleranceColors,parent.color,4);
                        ColorCodeJS.updateToleranceBand()
                        ColorCodeJS.doCalculations(tabSelector_colorCode.currentIndex);
                    }
                }
            }
        }
    }
