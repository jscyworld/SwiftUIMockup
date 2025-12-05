//
//  SettingView.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/19/25.
//

import SwiftUI

struct SettingView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var router: Router
    
    
    // MARK: - UI
    
    var body: some View {
        content
            .padding()
    }
    
    private var content: some View {
        VStack {
            HStack(spacing: 0.0) {
                Button(action: didTappedBackButton) {
                    Text("Back")
                }
                Spacer()
            }
            Text("SETTING")
                .frame(maxHeight: .infinity)
        }
    }
}

extension SettingView {
    
    // MARK: - Function (User Input)
    
    func didTappedBackButton() {
        moveToMain()
    }
    
    
    // MARK: - Function (Route)
    
    func moveToMain() {
        router.set(root: .main)
    }
}

#Preview {
    SettingView()
        .environmentObject(Router.init())
}
