//
//  SplashView.swift
//  Heist
//
//  Created by Sirius_Haii on 11/19/25.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var router: Router
    
    
    // MARK: - UI
    
    var body: some View {
        content
            .task {
                startSequence()
            }
    }
    
    private var content: some View {
        Text("SPLASH")
    }
}

extension SplashView {
    
    // MARK: - Function (Route)
    
    func moveToMain() {
        router.set(root: .main)
    }
    
    
    // MARK: - Function (Action)
    
    func startSequence() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            moveToMain()
        }
    }
}


#Preview {
    SplashView()
        .environmentObject(Router.init())
}
