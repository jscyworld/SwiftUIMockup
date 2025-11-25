//
//  UIDevice+Extension.swift
//  Heist
//
//  Created by Sirius_Haii on 11/25/25.
//

import SwiftUI

extension UIDevice {
    var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    var isMac: Bool {
        return UIDevice.current.userInterfaceIdiom == .mac
    }
}
