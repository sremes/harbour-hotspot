# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-hotspot

CONFIG += sailfishapp

QT += dbus

#LIBS += -lconnman-qt5
PKGCONFIG += connman-qt5

SOURCES += src/harbour-hotspot.cpp \
    src/tethering.cpp

OTHER_FILES += qml/harbour-hotspot.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-hotspot.spec \
    rpm/harbour-hotspot.yaml \
    harbour-hotspot.desktop \
    qml/pages/HotSpot.qml \
    src/tethering.js

HEADERS += \
    src/tethering.h


