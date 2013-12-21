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

import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.hotspot.tethering 1.0
import "pages"

ApplicationWindow
{
    id: app

    property bool hotspot_enabled : false
    property string tech_type : "wifi"
    property bool enable_timer : false
    property bool disable_timer : false

    // defaults:
    property string hotspot_name : 'jolla'
    property string hotspot_passwd : '12345678'

    initialPage: HotSpot { }

    cover: Qt.resolvedUrl("cover/CoverPage.qml")

    Tethering {
        id: tethering
    }

    Timer {
        id: timer1
        running: app.enable_timer
        repeat: true

        onTriggered: {
            app.enable_timer = false

            tethering.enable_tethering(app.hotspot_name, app.hotspot_passwd)

            console.log('enabled tethering')
        }
    }
    Timer {
        id: timer2
        running: app.disable_timer
        repeat: true

        onTriggered: {
            app.disable_timer = false

            tethering.disable_tethering()

            console.log('disabled tethering')
        }
    }
}
