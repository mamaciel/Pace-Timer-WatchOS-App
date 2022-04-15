//
//  Pace_TimerApp.swift
//  Pace Timer WatchKit Extension
//
//  Created by TSCMac on 4/13/22.
//

import SwiftUI

@main
struct Pace_TimerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
