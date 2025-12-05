//
//  MainContentView.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/19/25.
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
    
    // test commit
}

#Preview {
    MainContentView()
        .environmentObject(Router.init())
}
