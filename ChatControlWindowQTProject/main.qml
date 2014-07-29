import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.0

import './qml'

ApplicationWindow {
    id:window
    width: 1200
    height: 900
    visible: true


    MainTemplate {
        id:controlScreen
        width: window.width
        height: window.height

        Keys.onPressed: {
            if(event.key == Qt.Key_K){
                Qt.quit()
            }
        }
    }
}
