//
//  MainView+Route.swift
//  Heist
//
//  Created by Sirius_Haii on 11/19/25.
//

import Foundation

extension MainView {
    
    // MARK: - Function (Route)
    
    func move(to root: Router.Root) {
        router.set(root: root)
    }
    
    func present(_ sheet: Sheet) {
        router.main.sheet = sheet
    }
}
