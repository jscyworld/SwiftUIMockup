//
//  RootView.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/19/25.
//

import SwiftUI

struct RootView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var router: Router
    
    
    // MARK: - UI
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        switch router.root {
        case .splash:
            SplashView()
        case .main:
            MainView()
        case .setting:
            SettingView()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(Router.init())
}
