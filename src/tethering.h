/*
    WiFi Hotspot - use your Sailfish device to create a WiFi hotspot
    Copyright (C) 2013 Sami Remes <sami.remes@gmail.com>.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

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
