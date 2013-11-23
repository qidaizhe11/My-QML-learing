TEMPLATE = lib
CONFIG += qt plugin
QT += qml

DESTDIR += ../imports/FileDialog
OBJECTS_DIR = tmp
MOC_DIR = tmp

TARGET = filedialogplugin

HEADERS += \
    DialogPlugin.h \
    DialogPlugin.h

SOURCES += \
    DialogPlugin.cpp
