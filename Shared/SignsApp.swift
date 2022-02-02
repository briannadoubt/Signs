//
//  SignsApp.swift
//  Shared
//
//  Created by Bri on 2/1/22.
//

import SwiftUI

@main
struct SignsApp: App {
    var body: some Scene {
        WindowGroup {
            SignsHandler { signs, loadSigns in
                ContentView(signs: signs, loadSigns: loadSigns)
            }
        }
    }
}
