TEMPLATE = app

QT += qml quick
TARGET = CPUInfo
SOURCES += main.cpp \
    cpuinfo.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    cpuinfo.h

