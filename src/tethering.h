#ifndef TETHERING_H
#define TETHERING_H

#include<QString>
#include<QObject>
#include <QtCore/QPointer>

#include<iostream>

#include<connman-qt5/networkmanager.h>
#include<connman-qt5/networktechnology.h>

class Tethering : public QObject {
    Q_OBJECT
public:
    explicit Tethering(QObject* parent = 0) : QObject(parent) {
        manager = new NetworkManager(this);
    }

    Q_INVOKABLE void enable_tethering(QString ssid, QString passwd);
    Q_INVOKABLE void disable_tethering();
private:
    QPointer<NetworkManager> manager;
};

#endif // TETHERING_H
