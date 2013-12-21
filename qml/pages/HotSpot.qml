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

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            id: pullDownMenu
            MenuItem {
                id: aboutMenuAction
                text: "About"
                onClicked: {
                    console.log("aboutMenuAction clicked")
                }
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "WiFi Hotspot"
            }
            Label {
                x: Theme.paddingLarge
                text: "Enabled: " + app.hotspot_enabled
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            // Get hotspot name
            Label {
                x: Theme.paddingLarge
                text: "Hotspot name:"
            }
            TextField {
                id: input_name
                text: app.hotspot_name
                EnterKey.enabled: text.length > 0
                EnterKey.onClicked: {
                    app.hotspot_name = input_name.text
                    input_passwd.focus = true
                }
            }


            // Get hotspot password
            Label {
                x: Theme.paddingLarge
                text: "Hotspot password (min. length 8):"
            }
            TextField {
                id: input_passwd
                text: app.hotspot_passwd
                EnterKey.enabled: text.length > 7
                EnterKey.onClicked: {
                    app.hotspot_passwd = input_passwd.text
                    input_passwd.focus = false
                }
            }



            Button {
                id: button_enable
                text: "Enable HotSpot"
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    // trigger timers to actually do the job
                    app.enable_timer = !app.hotspot_enabled // enable if it was'nt on
                    app.disable_timer = app.hotspot_enabled // disable if it was on
                    app.hotspot_enabled = !app.hotspot_enabled

                    // change status display
                    button_enable.text = (app.hotspot_enabled ? "Disable" : "Enable") + " HotSpot"
                }
            }
        }
    }
}
