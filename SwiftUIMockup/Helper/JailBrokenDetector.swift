//
//  JailBrokenDetector.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/25/25.
//

import UIKit

struct JailBrokenDetector {
    
    // MARK: - Properties (Computed)
    
    private static let jailBrokenPaths: [String] = [
        "/Applications/Cydia.app",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt",
        "/usr/bin/ssh",
        "/private/var/lib/apt",
    ]
    
    private static let jailBrokenURLSchemes: [String] = [
        "cydia://package/com.example.package"
    ]
    
    private static let jailBrokenPrivatePath: String = "/private/jailbreak.txt"
    
    
    // MARK: - Function
    
    private static func containsFile(for paths: [String]) -> Bool {
        let fileManager = FileManager.default
        
        for path in paths {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        
        return false
    }
    
    private static func containsCanOpenURL(url: [String]) -> Bool {
        for scheme in jailBrokenURLSchemes {
            guard let url = URL(string: scheme) else { continue }
            
            if UIApplication.shared.canOpenURL(url) {
                return true
            }
        }
        
        return false
    }
    
    private static func canWriteToFile(for path: String) -> Bool {
        let testString = "has jailbroken"
        do {
            try testString.write(toFile: jailBrokenPrivatePath, atomically: true, encoding: .utf8)
            return true
            
        } catch {
            let fileManager = FileManager.default
            try? fileManager.removeItem(atPath: jailBrokenPrivatePath)
            return false
        }
    }
}

extension JailBrokenDetector {
    
    static var hasJailBroken: Bool {
#if targetEnvironment(simulator)
        return false
#else
        return containsFile(for: jailBrokenPaths) ||
        containsCanOpenURL(url: jailBrokenPaths) ||
        containsCanOpenURL(url: jailBrokenURLSchemes) ||
        canWriteToFile(for: jailBrokenPrivatePath)
#endif
    }
}
