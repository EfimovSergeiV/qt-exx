import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import QtGraphicalEffects 1.15
import "../src/controls/"

Window {
    width: 800
    height: 480
    minimumWidth: 800
    minimumHeight: 480
    visible: true
    title: qsTr("МСО 750")

//    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id: bg
        color: "#2c313c"
        border.color: "#383e4c"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z: 1

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

//            Rectangle {
//                id: topBar
//                height: 60
//                color: "#1c1d20"
//                anchors.left: parent.left
//                anchors.right: parent.right
//                anchors.top: parent.top
//                anchors.rightMargin: 0
//                anchors.leftMargin: 0
//                anchors.topMargin: 0

//                ToggleButton {
//                    onClicked: animationMenu.running = true
//                }

//                Rectangle {
//                    id: topBarDescription
//                    y: 28
//                    height: 25
//                    color: "#282c34"
//                    anchors.left: parent.left
//                    anchors.right: parent.right
//                    anchors.bottom: parent.bottom
//                    anchors.rightMargin: 0
//                    anchors.leftMargin: 70
//                    anchors.bottomMargin: 0

////                    Label {
////                        id: labelTopInfo
////                        color: "#5f6a82"
////                        text: qsTr("Application description")
////                        anchors.left: parent.left
////                        anchors.right: parent.right
////                        anchors.top: parent.top
////                        anchors.bottom: parent.bottom
////                        verticalAlignment: Text.AlignVCenter
////                        anchors.bottomMargin: 0
////                        anchors.rightMargin: 300
////                        anchors.topMargin: 0
////                        anchors.leftMargin: 10
////                    }

////                    Label {
////                        id: labelRightInfo
////                        color: "#5f6a82"
////                        text: qsTr("| HOME")
////                        anchors.left: labelTopInfo.right
////                        anchors.right: parent.right
////                        anchors.top: parent.top
////                        anchors.bottom: parent.bottom
////                        horizontalAlignment: Text.AlignRight
////                        verticalAlignment: Text.AlignVCenter
////                        anchors.topMargin: 0
////                        anchors.rightMargin: 10
////                        anchors.leftMargin: 0
////                        anchors.bottomMargin: 0
////                    }
//                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if(active){
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/icon_app_top.svg"
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 5
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

//                    Label {
//                        id: label
//                        color: "#c3cbdd"
//                        text: qsTr("My Application Title")
//                        anchors.left: iconApp.right
//                        anchors.right: parent.right
//                        anchors.top: parent.top
//                        anchors.bottom: parent.bottom
//                        verticalAlignment: Text.AlignVCenter
//                        font.pointSize: 10
//                        anchors.leftMargin: 5
//                    }
                }

//                Row {
//                    id: rowBtns
//                    x: 872
//                    width: 105
//                    height: 35
//                    anchors.right: parent.right
//                    anchors.top: parent.top
//                    anchors.topMargin: 0
//                    anchors.rightMargin: 0

//                    TopBarButton{
//                        id: btnMinimize
//                        onClicked: {
//                            mainWindow.showMinimized()
//                            internal.restoreMargins()
//                        }
//                    }

//                    TopBarButton {
//                        id: btnMaximizeRestore
//                        btnIconSource: "../images/svg_images/maximize_icon.svg"
//                        onClicked: internal.maximizeRestore()
//                    }

//                    TopBarButton {
//                        id: btnClose
//                        btnColorClicked: "#ff007f"
//                        btnIconSource: "../images/svg_images/close_icon.svg"
//                        onClicked: mainWindow.close()
//                    }
//                }
//            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#1c1d20"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0

                    PropertyAnimation{
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width == 70) return 250; else return 70
                        duration: 500
                        easing.type: Easing.InOutQuint
                    }

                    Column {
                        id: columnMenus
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        clip: true
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        ToggleButton {
                            onClicked: animationMenu.running = true
                        }

                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            text: qsTr("Загрузка программы")
                            isActiveMenu: true
                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                            }
                        }
                        LeftMenuBtn {
                            id: btnVisualization
                            width: leftMenu.width
                            text: qsTr("Визуализация")
                            isActiveMenu: false
                            onClicked: {
                                btnVisualization.isActiveMenu = true
                                btnHome.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/VisualizationPage.qml"))
                            }
                        }


//                        LeftMenuBtn {
//                            id: btnOpen
//                            width: leftMenu.width
//                            text: qsTr("Open")
//                            btnIconSource: "../images/svg_images/open_icon.svg"

//                            onPressed: {
//                                fileOpen.open()
//                            }

//                            FileDialog{
//                                id: fileOpen
//                                title: "Please choose a file"
//                                folder: shortcuts.home
//                                selectMultiple: false
//                                nameFilters: ["Text File (*.txt)"]
//                                onAccepted: {
//                                    backend.openFile(fileOpen.fileUrl)
//                                }
//                            }
//                        }

//                        LeftMenuBtn {
//                            id: btnSave
//                            width: leftMenu.width
//                            text: qsTr("Save")
//                            btnIconSource: "../images/svg_images/save_icon.svg"

//                            onPressed: {
//                                fileSave.open()
//                            }

//                            FileDialog{
//                                id: fileSave
//                                title: "Save file"
//                                folder: shortcuts.home
//                                nameFilters: ["Text File (*.txt)"]
//                                selectExisting: false
//                                onAccepted: {
//                                    backend.getTextField(actualPage.getText)
//                                    backend.writeFile(fileSave.fileUrl)
//                                }
//                            }
//                        }
                    }

                    LeftMenuBtn {
                        id: btnSettings
                        width: leftMenu.width
                        text: qsTr("Settings")
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        btnIconSource: "../images/svg_images/settings_icon.svg"
                        onClicked: {
                            btnHome.isActiveMenu = false
                            btnVisualization.isActiveMenu = false
                            btnSettings.isActiveMenu = true
                            stackView.push(Qt.resolvedUrl("pages/settingsPage.qml"))
                        }
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#00000000"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        initialItem: Qt.resolvedUrl("pages/homePage.qml")
                    }
                }

//                Rectangle {
//                    id: rectangle
//                    color: "#282c34"
//                    anchors.left: leftMenu.right
//                    anchors.right: parent.right
//                    anchors.top: contentPages.bottom
//                    anchors.bottom: parent.bottom
//                    anchors.rightMargin: 0
//                    anchors.leftMargin: 0
//                    anchors.bottomMargin: 0
//                    anchors.topMargin: 0

//                    Label {
//                        id: labelTopInfo1
//                        color: "#5f6a82"
//                        text: qsTr("Application description")
//                        anchors.left: parent.left
//                        anchors.right: parent.right
//                        anchors.top: parent.top
//                        anchors.bottom: parent.bottom
//                        verticalAlignment: Text.AlignVCenter
//                        anchors.topMargin: 0
//                        anchors.rightMargin: 30
//                        anchors.leftMargin: 10
//                        anchors.bottomMargin: 0
//                    }

//                    MouseArea {
//                        id: resizeWindow
//                        x: 884
//                        y: 0
//                        width: 25
//                        height: 25
//                        opacity: 0.5
//                        anchors.right: parent.right
//                        anchors.bottom: parent.bottom
//                        anchors.bottomMargin: 0
//                        anchors.rightMargin: 0
//                        cursorShape: Qt.SizeFDiagCursor

//                        DragHandler{
//                            target: null
//                            onActiveChanged: if (active){
//                                                 mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
//                                             }
//                        }

//                        Image {
//                            id: resizeImage
//                            width: 16
//                            height: 16
//                            anchors.fill: parent
//                            source: "../images/svg_images/resize_icon.svg"
//                            anchors.leftMargin: 5
//                            anchors.topMargin: 5
//                            sourceSize.height: 16
//                            sourceSize.width: 16
//                            fillMode: Image.PreserveAspectFit
//                            antialiasing: false
//                        }
//                    }
//                }
            }
        }
    }
}
