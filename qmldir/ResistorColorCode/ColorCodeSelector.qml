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

        property var colors: ["#000000","#a0522d","#ff0000","#fe6500","#ffff00","#009800","#3233ff","#cd33cd","#8a8a8a","#ffffff"]
        property int selectedColor: -1;

        Repeater
        {
            model: 10
            Rectangle
            {
                height: parent.height/11
                width: parent.width;
                color: colors[modelData];
                border.color: "white"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: function fun()
                    {
                        selectedColor = ColorCodeJS.getNumerator(colors,parent.color,10);
                        ColorCodeJS.doCalculations(tabSelector_colorCode.currentIndex);
                        ColorCodeJS.updateBands(tabSelector_colorCode.currentIndex)
                    }
                }
            }
        }
    }
