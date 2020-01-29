import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ToolBar //TOP BAR that contains logo and button for settings and about author
    {
        z:1;
        id: menu
        width: parent.width;

        RowLayout
        {
            ToolButton {
                text: "ResistorColorCode"
            }
        }

        RowLayout
        {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right:  parent.right
            /*
            ToolButton {
                text: "?"
                //onClicked: stackLayout.currentIndex = 0;
            }

            ToolButton {
                text: "⋮"
                //onClicked: settingsPopUp.open()
            }
            */
        }
    }//ToolBar
