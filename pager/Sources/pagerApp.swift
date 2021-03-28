//
//  pagerApp.swift
//  pager
//
//  Created by Daniil Subbotin on 26.03.2021.
//

import SwiftUI

@main
struct pagerApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .navigationTitle("Учет времени")
            }
        }
    }
}
