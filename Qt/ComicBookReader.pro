QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
#INCLUDEPATH += $$PWD/../3dparts/include/opencv

win32 {
    #Files for opencv
    INCLUDEPATH += $$PWD/../3dparts/include/opencv
    #LIBS += -L$$PWD/../3dparts/lib/opencv -lopencv_core331 -lopencv_imgcodecs331 -lopencv_imgproc331
    LIBS += -L$$PWD/../3dparts/lib/opencv -lopencv_world3415d -lopencv_world3415

    #Files for unarr
    INCLUDEPATH += $$PWD\..\3dparts\include\unarr
    LIBS += -L"$$PWD\\..\\3dparts\\lib\\unarrlib" \
        -lunarr

    QMAKE_CXXFLAGS_RELEASE -= -O
    QMAKE_CXXFLAGS_RELEASE -= -O1
    QMAKE_CXXFLAGS_RELEASE -= -O2
    QMAKE_CXXFLAGS_RELEASE *= -Ox
}

##########
#Files for ComicBookReader
INCLUDEPATH += ..\include\
INCLUDEPATH += ..\src\
##########


SOURCES += \
    ../src/archiveManager.cpp \
    ../src/imageProcess.cpp \
    ../src/imgprovider.cpp \
    ../src/main.cpp \
    ../src/preloadManager.cpp


RESOURCES += ../src/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    ../include/archiveManager.h \
    ../include/imageProcess.h \
    ../include/imgprovider.h \
    ../include/cache.h \
    ../include/preloadManager.h


DISTFILES += \
    ../src/CustomButton.qml \
    ../src/CustomSeparator.qml \
    ../src/CustomSeparatorHorizontal.qml \
    ../src/CustomSlider.qml \
    ../src/CustomSliderVertical.qml \
    ../src/main.qml
