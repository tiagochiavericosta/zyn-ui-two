import QtQuick 2.0
import ZynAddSubFX 1.0
import "qrc:/qml/"

HSlider {
    id: slider
    property variant text: -1
    function updateValue(norm_dy)
    {
        var tmp = slider.t - norm_dy
        if(tmp > 1) {
            tmp = 1
        } else if(tmp < -1) {
            tmp = -1 
        }
        slider.t = tmp
    }

    MouseArea {
        id: mouse
        drag.axis: Drag.XAxis;
        anchors.fill: parent
        property variant previousPosition
        onPressed: {
            previousPosition = Qt.point(mouseX, mouseY)
        }
        onPositionChanged: {
            if (pressedButtons == Qt.LeftButton)
            {
                var dx = mouseX - previousPosition.x
                var dy = mouseY - previousPosition.y
                previousPosition = Qt.point(mouseX, mouseY)
                updateValue(dx/200.0)
            }
        }
    }
}
