import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: root
    width: 640
    height: 480
    visible: true
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    title: qsTr("39_1")

    Rectangle {
        id: scene
        anchors.fill: parent
        state: "InitialState"

        Rectangle {
            id: leftRectangle
            x: 100
            y: 200
            width: 100
            height: 100
            color: "lightgray"
            border.color: "black"
            border.width: 3
            radius: 5

            MouseArea {
                id: leftRectangleArea
                anchors.fill: parent
                onClicked: {
                    if(ball.x == rightRectangle.x + 5) {
                        scene.state = "InitialState"
                    } else if(ball.x < rightRectangle.x) {
                        ball.x += 30
                        scene.state = "OtherState"
                    }
                }
            }

            Text {
                id: nameLeftRectangle
                anchors.centerIn: parent
                text: qsTr("Move")
            }
        }

        Rectangle {
            id: rightRectangle
            x: 400
            y: 200
            width: 100
            height: 100
            color: "lightgray"
            border.color: "black"
            border.width: 3
            radius: 5

            MouseArea {
                id: rightRectangleArea
                anchors.fill: parent
                onClicked: { scene.state = "InitialState" }
            }

            Text {
                id: nameRightRectangle
                anchors.centerIn: parent
                text: qsTr("Return")
            }
        }

        Rectangle {
            id: ball
            color: "darkgreen"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2
        }

        states: [
            State {
                name: "OtherState"

                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            },

            State {
                name: "InitialState"

                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 5
                }
            },

            State {
                name: "EndState"

                PropertyChanges {
                    target: ball
                    x: rightRectangle.x + 5
                }
            }

        ]

        transitions: [
            Transition {
                from: "OtherState"
                to: "InitialState"

                NumberAnimation {
                    properties: "x, y"
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
            },

            Transition {
                from: "EndState"
                to: "InitialState"


                NumberAnimation {
                    properties: "x, y"
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
            }
        ]
    }
}
