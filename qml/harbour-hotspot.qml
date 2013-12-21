/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
//import org.nemomobile.dbus 1.0
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

//    DBusInterface {
//        id: manager
//        destination: "net.connman"
//        //path: "/net/connman/Manager/"
//        path: "/"
//        iface: "net.connman.Manager"
//        busType: "SystemBus"
//    }

//    DBusInterface {
//        id: technology
//        destination: "net.connman"
//        path: ""
//        iface: "net.connman.Technology"
//        busType: "SystemBus"
//    }

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

//            // do dbus stuff
//            console.log('getting technologies')
//            var technologies = new Object
//            manager.typedCallWithReturn('GetTechnologies', undefined, technologies)
//            //var technologies = manager.GetTechnologies()
//            console.log(technologies)
//            console.log('got them!')
//            for (var path in technologies) {
//                console.log(path)
//                technology.path = path
//                var properties = technology.call('GetProperties',undefined)
//                console.log(properties["Type"])
//                if (properties["Type"] == app.tech_type) {
//                    technology.setProperty
//                    technology.call('SetProperty', 'TetheringIdentifier',
//                                    app.hotspot_name)
//                    technology.call('SetProperty', 'TetheringPassphrase',
//                                    app.hotspot_passwd)
//                    technology.call('SetProperty', 'Tethering', true)
//                    break
//                }
//            }

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

//            // do dbus stuff
//            var technologies = manager.call('GetTechnologies','')
//            for (var path in technologies) {
//                technology.path = path
//                var properties = technology.call('GetProperties','')
//                if (properties["Type"] == app.tech_type) {
//                    technology.call('SetProperty', 'Tethering', false)
//                    break
//                }
//            }

            console.log('disabled tethering')
        }
    }
}


