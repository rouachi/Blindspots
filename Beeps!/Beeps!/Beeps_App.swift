//
//  Beeps_App.swift
//  Beeps!
//
//  Created by Rym Benrafalia on 24/02/2022.
//

import SwiftUI

@main
struct Beeps_App: App {
    @ObservedObject var bleManager = BLEManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView() //creat first view that user sees
        }
    }
}
