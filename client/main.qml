import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4

Window {
    visible: true
    width: 860
    height: 640
    title: qsTr("Chat app")

    function handleOnClick() {
        mainViewId.visible = true
        signInViewId.visible = false
    }


    function handleSelectUser(name: string) {
        console.log(name)
    }


    Rectangle {
        id: mainViewId
        anchors.fill: parent
        visible: true
        Rectangle {
            id: listRectId
            anchors {
                top: parent.top
            }
            width: 200
            height: parent.height
            color: "#cccccc"


            ScrollView {
                anchors.fill: parent
                ListView {
                    id: userListId
                    anchors.top: parent.top
                    width: parent.width
                    height: contentHeight

                    model: users.get_users()
                    delegate: Component {

                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width - 10
                            height: 52
                            color: "transparent"
                            Rectangle {
                                id: userViewId
                                width: parent.width
                                height: 44
                                anchors.centerIn: parent
                                radius: 10
                                Text {
                                    leftPadding: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: modelData
                                    font.pointSize: 12
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        handleSelectUser(modelData)
                                    }
                                }
                            }

                            Rectangle {
                                anchors.top: userViewId.bottom
                                height: 10
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: chatViewRectId
            anchors {
                left: listRectId.right
                top: parent.top
            }
            width: 660
            height: parent.height
            color: "#333333"
        }
    }

    Rectangle {
        id: signInViewId
        anchors.fill: parent
        visible: false

        Rectangle {
            anchors.centerIn: parent
            width: 400
            height: 250
            border {
                width: 2
                color: "#cccccc"
            }
            radius: 20

            Text {
                id: signInTextId
                topPadding: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Sign in"
                font.pointSize: 16
                font.bold: true
            }

            Text {
                topPadding: 20
                leftPadding: 20
                rightPadding: 20
                id: usernameTextId
                anchors.top: signInTextId.bottom
                text: "Username"

            }

            Rectangle {
                id: usernameInputId
                anchors.top: usernameTextId.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#E1D8D6"
                height: 40
                width: parent.width - 40
                radius: 16
                TextInput {
                    leftPadding: 20
                    width: parent.width
                    anchors.centerIn: parent
                }
            }

            Text {
                topPadding: 20
                leftPadding: 20
                rightPadding: 20
                id: passwordTextId
                anchors.top: usernameInputId.bottom
                text: "Password"

            }

            Rectangle {
                id: passwordInputId
                anchors.top: passwordTextId.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#E1D8D6"
                height: 40
                width: parent.width - 40
                radius: 16
                TextInput {
                    leftPadding: 20
                    width: parent.width
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: signInGapId
                anchors.top: passwordInputId.bottom
                height: 16
            }

            Rectangle {
                anchors.top: signInGapId.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#3AE5D3"
                width: 100
                height: 30
                radius: 4
                Text {
                    anchors.centerIn: parent
                    text: qsTr("Sign in")
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.OpenHandCursor
                    onClicked: {
                        handleOnClick()
                    }
                }
            }
        }
    }

}
