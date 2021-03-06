import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

Window {
    id: window
    visible: true
    width: 720
    height: 480
    title: qsTr("ComicBookReader")

    Item {
        anchors.fill: parent
        anchors.centerIn: parent
        Keys.onRightPressed: buttonPageUp.pageUp()
        Keys.onLeftPressed: buttonPageDown.pageDown()
        Keys.onUpPressed: buttonPageUp.pageUp()
        Keys.onDownPressed: buttonPageDown.pageDown()
        MouseArea {
            id: mouseArea
            width: parent.width
            anchors.top:bottomBar.bottom
            anchors.bottom: slider.top
            anchors.left: parent.left
            anchors.right: parent.right
            Layout.fillHeight: true

            drag.target: showWindow
            enabled: true
            property double factor: 1.25

            property double oldImgX: 0.0
            property double oldImgY: 0.0
            hoverEnabled: true
            onWheel:{
                oldImgX = showWindow.x
                oldImgY = showWindow.y
                if(wheel.modifiers & Qt.ControlModifier){
                    if( wheel.angleDelta.y > 0 )  // zoom in
                    {
                        showWindow.width *= factor
                        showWindow.height *= factor
                        showWindow.x = oldImgX - (factor - 1)*(mouseX - oldImgX)
                        showWindow.y = oldImgY - (factor -1)*(mouseY - oldImgY)

                    }
                    else if( wheel.angleDelta.y < 0 ){                        // zoom out
                        showWindow.width /= factor
                        showWindow.height /= factor
                        showWindow.x = oldImgX + (1 - 1/factor)*(mouseX - oldImgX)
                        showWindow.y = oldImgY + (1 - 1/factor)*(mouseY - oldImgY)

                    }

                }


            }
            Item{

                id: showWindow
                width: parent.width
                height: parent.height
                anchors.horizontalCenter : parent.horizontalCenter
                anchors.verticalCenter : parent.verticalCenter
                Image {
                    id: showImage
                    objectName:"ShowImage"
                    width: (showImage2.status == Image.Error||showImage2.status == Image.Null || showImage2.opacity == 0.0) ? parent.width : parent.width*0.48
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0

                    property int pageNum: 1
                    property int showMode: 2 //0 for text, 1 for graphic, 2 for raw
                    property int trigger: 0
                    source: "image://ImageProvider/" + pageNum.toString() + "/" + showMode.toString() + "/" + trigger

                    cache: false
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                    onPageNumChanged: {


                        if(pageNum > slider.to){

                            pageNum = slider.to;
                        }else if(pageNum < 1){
                            pageNum = 1;
                        }

                        showWindow.anchors.horizontalCenter = showWindow.parent.horizontalCenter
                        showWindow.anchors.verticalCenter = showWindow.parent.verticalCenter
                        if(showImage2.isShow == true){
                            if(pageNum == slider.to) pageNum -= 1;
                            showImage2.source = "image://ImageProvider/" + (showImage.pageNum + 1).toString() + "/" + showImage.showMode.toString()+ "/" + showImage2.trigger
                        }

                    }


                }

                Image{
                     id: showImage2
                     objectName: "ShowImage2"
                     property bool isShow: false
                     property int trigger: 0
                     width: parent.width *0.48
                     anchors.right: parent.right
                     anchors.top: parent.top
                     anchors.bottom: parent.bottom
                     opacity: 0.0
                     cache: false
                     fillMode: Image.PreserveAspectFit
                     mipmap: true

                }


                Drag.active: mouseArea.drag.active

                states: State {
                        when: mouseArea.drag.active

                        AnchorChanges { target: showWindow; anchors.verticalCenter: undefined; anchors.horizontalCenter: undefined }
                }

                function zoom(p){
                    var oldImgX;
                    var oldImgY;
                    oldImgX = showWindow.x;
                    oldImgY = showWindow.y;
                    showWindow.width *= p;
                    showWindow.height *= p;
                    showWindow.x = showWindow.parent.width/2.0 - p*(showWindow.parent.width/2.0 - oldImgX);
                    showWindow.y = showWindow.parent.height/2.0 - p*(showWindow.parent.height/2.0 - oldImgY);
                }


                Connections {
                    target: buttonZoomIn
                    onClicked: showWindow.zoom(1.25)
                }
                Connections{
                    target: buttonZoomOut
                    onClicked: showWindow.zoom(0.8)
                }

                Connections{
                    target: buttonTwoPageViewSwitch
                    onClicked:{
                        if( showImage2.opacity == 0){
                            showImage2.opacity = 1.0
                            showImage2.isShow = true
                            showImage2.source = "image://ImageProvider/" + (showImage.pageNum + 1).toString() + "/" + showImage.showMode.toString() + "/" + showImage2.trigger
                        }
                        else{
                            showImage2.opacity = 0.0
                            showImage2.isShow = false
                            source: undefined
                        }
                    }
                }
                Connections{
                    target: buttonTextMode
                    onClicked:{
                        showImage.showMode = 0
                    }
                }
                Connections{
                    target: buttonGraphicMode
                    onClicked:{
                        showImage.showMode = 1
                    }
                }
                Connections{
                    target: buttonRawMode
                    onClicked:{
                        showImage.showMode = 2
                    }
                }
                Connections{
                    target:showImage
                    onShowModeChanged:{
                        if( showImage2.isShow == true){
                             showImage2.source = "image://ImageProvider/" + (showImage.pageNum + 1).toString() + "/" + showImage.showMode.toString() + "/" + showImage2.trigger
                        }
                    }
                }

            }


            onWidthChanged: {
                showWindow.anchors.horizontalCenter = mouseArea.horizontalCenter
                showWindow.anchors.verticalCenter = mouseArea.verticalCenter
            }
            onHeightChanged: {
                showWindow.anchors.horizontalCenter = mouseArea.horizontalCenter
                showWindow.anchors.verticalCenter = mouseArea.verticalCenter
            }
        }
        CustomSlider {
            id:slider
            anchors.bottom:  parent.bottom
            width:parent.width
            objectName: "SlideBar"
            anchors.bottomMargin: 10
            rightPadding: 3
            bottomPadding: 0
            leftPadding: 3
            topPadding: 0
            from : 1
            value: 1
            to :1
            snapMode: Slider.SnapOnRelease
            stepSize: 1
            Connections {
                target: showImage

                onPageNumChanged: {
                    slider.value = showImage.pageNum
                }
            }
            onValueChanged: {
                showImage.pageNum = slider.value;
            }



        }
        CustomButton {
            id: buttonPageDown
            width: parent.width/2.0
            text: qsTr("<<")
            anchors.left: slider.left
            anchors.bottom: slider.top
            function pageDown(){
                if(showImage2.isShow == false)   showImage.pageNum -=1
                else showImage.pageNum -=2
            }

            onClicked: pageDown()
        }
        CustomButton {
            id: buttonPageUp
            text: qsTr(">>")
            anchors.bottom: slider.top
            anchors.left: buttonPageDown.right
            anchors.right: slider.right
            function pageUp(){
                if(showImage2.isShow == false)   showImage.pageNum +=1
                else showImage.pageNum +=2
            }

            onClicked: {
                pageUp()
            }
        }
        ToolBar{
            id: bottomBar
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 50
            RowLayout {
                anchors.rightMargin: 0
                anchors.fill: parent

                CustomButton {
                        text: qsTr(" Ouvrir ")
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        FileDialog {
                            id: fileDialog
                            objectName: "FileDialog"
                            title: "Please choose a file"
                            folder: shortcuts.home
                            nameFilters: [ "cbr cbz files (*.cbr *.cbz)", "Image files (*.png *.jpg *.bmp)","All files (*)",  ]
                            selectMultiple: false
                            signal setFilePathSignal(string msg)
                            onAccepted: {
                                setFilePathSignal(fileDialog.fileUrl)

                            }
                            onRejected: {
                            }

                        }
                        onClicked: fileDialog.open()
                }
                CustomSeparator{}
                CustomButton {
                    id: buttonZoomIn
                    text: qsTr(" Zoom in ")
                }
                CustomSeparator{}
                CustomButton {
                    id: buttonZoomOut
                    text: qsTr(" Zoom out ")
                }
                CustomSeparator{}
                CustomButton {
                    id: buttonAutoFit
                    text: qsTr(" Auto Fit ")
                    function autoFit(){
                        showWindow.width = showWindow.parent.width;
                        showWindow.height = showWindow.parent.height;
                        showWindow.anchors.horizontalCenter = mouseArea.horizontalCenter
                        showWindow.anchors.verticalCenter = mouseArea.verticalCenter
                    }
                    onClicked: autoFit()
                }
                CustomSeparator{}
                CustomButton {
                    id: buttonModeSwitch
                    text: qsTr(" Mode ")//text or image
                    onClicked: modePopup.open()
                    Popup{
                        id: modePopup
                        width:100
                        height:150
                        x: parent.width/2 - width/2
                        y: -height-5
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                        padding: 0
                        ColumnLayout{
                            anchors.fill: parent
                            CustomButton{
                                id:buttonTextMode
                                text:qsTr("Text Mode")
                                height: parent.height/5
                                width: parent.width
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            CustomSeparatorHorizontal{}
                            CustomButton{
                                id:buttonGraphicMode
                                text:qsTr("Image Mode")
                                height: parent.height/5
                                width: parent.width
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            CustomSeparatorHorizontal{}
                            CustomButton{
                                id:buttonRawMode
                                text: qsTr("Raw Mode")
                                height: parent.height/5
                                width: parent.width
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                }
                CustomSeparator{}
                CustomButton {
                    id: buttonTwoPageViewSwitch
                    text: qsTr("Two") //two pages view
                }


            }
        }
    }


}
