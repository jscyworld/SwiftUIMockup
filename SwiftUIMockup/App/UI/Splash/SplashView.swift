//
//  SplashView.swift
//  Heist
//
//  Created by Sirius_Haii on 11/19/25.
//

import SwiftUI
import Combine

struct SplashView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var router: Router
    
    let splashInterval: TimeInterval = 2.0
    @State var timer: AnyCancellable?
    
    
    // MARK: - UI
    
    var body: some View {
        content
            .task {
                await startSequence()
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
}


#Preview {
    SplashView()
        .environmentObject(Router.init())
}
