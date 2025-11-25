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
    MainContentView()
        .environmentObject(Router.init())
}
