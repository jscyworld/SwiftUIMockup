//
//  SwiftUIMockupApp.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/19/25.
//

import SwiftUI

@main
struct SwiftUIMockupApp: App {
    
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
