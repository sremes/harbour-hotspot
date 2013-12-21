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
