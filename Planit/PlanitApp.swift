//
//  PlanitApp.swift
//  Planit
//
//  Created by Shivangi on 09/11/22.
//

import SwiftUI
import Firebase

@main
struct PlanitApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
