import QtQuick 2.5
import QtQuick.Extras 1.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3

Rectangle {
    property alias comboBox1: comboBox1
    property alias readFile: readFile
    property alias processor: processor.text
    property alias vendorId: vendorId.text
    property alias modelName: modelName.text
    property alias cpuMhz: cpuMhz.text
    property alias cacheSize: cacheSize.text
    property alias cpuCores: cpuCores.text

    width: 500
    height: 400

    Text {
        id: dialogTitle
        x: 60
        y: 0
        width: 374
        height: 70
        color: "#9b2929"
        text: qsTr("CPU Information Tool")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        font.pixelSize: 30
    }

    Image {
        id: image1
        width: 70
        height: 70
        source: "qrc:QtIcon.png"
    }

    Rectangle {
        id: rectangle1
        x: 0
        y: 70
        width: 500
        height: 70
        color: "#ffffff"

        ComboBox {
            id: comboBox1
            x: 157
            y: 10
            width: 200
            height: 50
        }

        Button {
            id: readFile
            x: 398
            y: 10
            width: 90
            height: 50
            text: qsTr("Read File")
        }

        Text {
            id: text1
            x: 20
            y: 10
            width: 90
            height: 50
            color: "#54aaca"
            text: qsTr("CPU ID:")
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 24
        }
    }

    GridLayout {
        id: gridLayout1
        x: 10
        y: 140
        width: 480
        height: 250
        rowSpacing: 2
        columnSpacing: 2
        columns: 2

        Text {
            id: text2
            text: qsTr("Processor:")
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: processor
            x: 18
            y: 118
            text: qsTr("---")
            font.pixelSize: 12
        }

        Text {
            id: text3
            text: qsTr("Vendor Id:")
            horizontalAlignment: Text.AlignRight
            font.bold: true
            font.pixelSize: 12
        }

        Text {
            id: vendorId
            x: 18
            y: 118
            text: qsTr("---")
            font.pixelSize: 12
        }

        Text {
            id: text4
            text: qsTr("Model Name:")
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: modelName
            x: 18
            y: 118
            text: qsTr("---")
            font.pixelSize: 12
        }

        Text {
            id: text5
            text: qsTr("CPU MHz:")
            horizontalAlignment: Text.AlignRight
            font.bold: true
            font.pixelSize: 12
        }

        Text {
            id: cpuMhz
            x: 18
            y: 118
            text: qsTr("---")
            font.pixelSize: 12
        }

        Text {
            id: text6
            text: qsTr("Cache Size:")
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: cacheSize
            x: 18
            y: 118
            text: qsTr("---")
            font.pixelSize: 12
        }

        Text {
            id: text7
            text: qsTr("CPU Cores")
            font.bold: true
            font.pixelSize: 12
        }

        Text {
            id: cpuCores
            x: 18
            y: 118
            text: qsTr("---")
            font.pixelSize: 12
        }
    }
}

