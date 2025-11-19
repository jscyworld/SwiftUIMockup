//
//  HeistApp.swift
//  Heist
//
//  Created by Sirius_Haii on 11/19/25.
//

import SwiftUI

@main
struct HeistApp: App {
    
    // MARK: - Initializer
    
    init() {
        self.router = .init()
    }
    
    
    // MARK: - Properties
    
    let router: Router
    
    
    // MARK: - App
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(router)
        }
    }
}
