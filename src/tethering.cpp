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

#include "tethering.h"

void Tethering::disable_tethering() {
    // Get the wifi technology
    NetworkTechnology* wifi = manager->getTechnology("wifi");

    if (wifi == 0) {
        std::cout << "Cannot find wifi!" << std::endl;
        return;
    }

    // Disable tethering
    wifi->setTethering(false);

    std::cout << "Disabled tethering" << std::endl;
}

void Tethering::enable_tethering(QString ssid, QString passwd) {
    // Get the wifi technology
    NetworkTechnology* wifi = manager->getTechnology("wifi");

    if (wifi == 0) {
        std::cout << "Cannot find wifi!" << std::endl;
        return;
    }

    // Enable tethering with given ssid and passwd
    wifi->setTetheringId(ssid);
    wifi->setTetheringPassphrase(passwd);
    wifi->setTethering(true);

    std::cout << "Enabled tethering" << std::endl;
    std::cout << ssid.toStdString() << ":" << passwd.toStdString() << std::endl;
}
