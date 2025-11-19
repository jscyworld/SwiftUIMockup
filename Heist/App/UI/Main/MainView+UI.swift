//
//  MainView+UI.swift
//  Heist
//
//  Created by Sirius_Haii on 11/19/25.
//

import Foundation

extension MainView {
    
    // MARK: - Function (User Input)
    
    func didTappedRefreshButton() {
        router.main.refresh()
    }
    
    func didTappedContentButton() {
        if #available(iOS 16.0, *) {
            router.main.path.append(.mainContentView)
        } else {
            showMainContent.toggle()
        }
    }
    
    func didTappedSettingButton() {
        move(to: .setting)
    }
    
    func didTappedPopupButton() {
        present(.popup)
    }
}
