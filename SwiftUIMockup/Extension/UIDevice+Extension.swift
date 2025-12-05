//
//  UIDevice+Extension.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/25/25.
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
