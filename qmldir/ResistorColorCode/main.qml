import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Item {
    id: item1

   TabBar {
       id: tabSelector_colorCode
       position: TabBar.Header;
       width: parent.width
       TabButton
       {
           text: "Otpornik sa 4 boje"
       }
       TabButton
       {
           text: "Otpornik sa 5 boje"
       }
   }

   StackLayout
   {
       id: stacklayout_colorCode
       anchors.top: tabSelector_colorCode.bottom;
       anchors.bottom: parent.bottom
       anchors.left: parent.left
       anchors.right: parent.right
       currentIndex: tabSelector_colorCode.currentIndex

      Resistor4color {
        id: _4colorResistorTab
        }

      Resistor5color
      {
        id: _5colorResistorTab
      }



}
}

/*##^## Designer {
    D{i:4;anchors_height:440;anchors_width:640}
}
 ##^##*/
