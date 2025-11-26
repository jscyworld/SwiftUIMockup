//
//  MainView.swift
//  Heist
//
//  Created by Sirius_Haii on 11/19/25.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Type
    
    typealias Destination = Router.Main.Destination
    typealias Sheet = Router.Main.Sheet
    
    
    // MARK: - Properties
    
    @EnvironmentObject var router: Router
    
    @State var showMainContent: Bool = false
    
    
    // MARK: - UI
    
    var body: some View {
        if #available(iOS 16.0, *) {
            naviContent
        } else {
            legacyNaviContent
                .navigationViewStyle(.stack)
        }
    }
    
    @available(iOS 16.0, *)
    private var naviContent: some View {
        NavigationStack(path: $router.main.path) {
            navigationHost
                .navigationDestination(for: Destination.self) { dest in
                    destination(to: dest)
                }
        }
    }
    
    @ViewBuilder
    private func destination(to destination: Destination) -> some View {
        switch destination {
        case .mainContentView:
            MainContentView()
        }
    }
    
    private var legacyNaviContent: some View {
        NavigationView {
            ZStack {
                navigationHost
                NavigationLink(destination: MainContentView(), isActive: $showMainContent) {
                    EmptyView()
                }
            }
        }
    }
    
    private var navigationHost: some View {
        VStack(spacing: 0.0) {
            content
                .frame(maxHeight: .infinity)
                .refresh(id: router.main.refreshID) {
                    await fetch()
                }
            Divider()
            buttonSection
                .frame(height: 56.0)
        }
        .sheet(item: $router.main.sheet, content: sheet(_:))
    }
    
    @ViewBuilder
    private func sheet(_ sheet: Sheet) -> some View {
        switch sheet {
        case .popup:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        VStack(spacing: 0.0) {
            mainHomeView
        }
    }
    
    private var mainHomeView: some View {
        VStack {
            Text("MAIN: \n\(router.main.refreshID)")
            Button(action: didTappedRefreshButton) {
                Text("Refresh")
            }
            Button(action: didTappedPopupButton) {
                Text("Pop up")
            }
        }
    }
    
    private var buttonSection: some View {
        HStack {
            Spacer()
            Button(action: didTappedContentButton) {
                Text("Content")
            }
            Spacer()
            Divider()
                .ignoresSafeArea()
            Spacer()
            Button(action: didTappedSettingButton) {
                Text("Setting")
            }
            Spacer()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Router.init())
}
