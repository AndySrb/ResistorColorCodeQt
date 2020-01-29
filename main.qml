import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import QtWebView 1.1
//import QtQuick.Controls.Styles 1.4
import "qmldir/Toolbars/Main"

ApplicationWindow {
    property string appName: "ResistorColorCode"
    visible: true
    width: 480
    height: 800
    title: qsTr(appName)
    Material.theme: Material.Standard
    id:app


   menuBar: MainToolBar { id: menu; } //Logo, Author, Settings

   Loader {
       id: qmlLoader
       anchors.topMargin: menu.bottom
       anchors.fill: parent
       visible: true
       source: "qrc:/qmldir/ResistorColorCode/main.qml"

   }





} //ApplicationWindow
