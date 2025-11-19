//
//  MainContentView.swift
//  Heist
//
//  Created by Sirius_Haii on 11/19/25.
//

import SwiftUI

struct MainContentView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var router: Router
    
    @Binding var isActive: Bool
    
    
    // MARK: - UI
    
    var body: some View {
        content
            .padding()
    }
    
    private var content: some View {
        VStack {
            Text("MAIN CONTENT VIEW")
                .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    MainContentView(isActive: .constant(true))
        .environmentObject(Router.init())
}
