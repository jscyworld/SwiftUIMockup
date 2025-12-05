//
//  Font+Style.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/25/25.
//

import SwiftUI

extension Font {
    
    static func regular(_ size: CGFloat) -> Font {
        return notosans(size, type: .regular)
    }
    
    static func bold(_ size: CGFloat) -> Font {
        return notosans(size, type: .bold)
    }
    
    static func medium(_ size: CGFloat) -> Font {
        return notosans(size, type: .medium)
    }
}

extension Font {
    
    // MARK: To-do: Custom 폰트 파일에 맞춰 변경
    enum WeightType {
        case regular
        case bold
        case medium
        
        var suffix: String {
            switch self {
            case .regular:      "Regular"
            case .bold:         "Bold"
            case .medium:       "Medium"
            }
        }
    }
    
    static func notosans(_ size: CGFloat, type: WeightType) -> Font {
        return .custom("NotoSansKR-\(type.suffix)", fixedSize: size)
    }
}

extension Text {
    
    func scaledFont(_ type: Font.WeightType, size: CGFloat, lineHeight height: CGFloat, color: Color) -> some View {
        let fonted: Text
        let scaledSize: CGFloat
        let scaledLineHeight: CGFloat?
        
        if UIDevice.current.isPhone {
            scaledSize = size / 2
            scaledLineHeight = height / 2
        } else {
            scaledSize = size
            scaledLineHeight = height
        }
        
        switch type {
        case .regular:
            fonted = font(.regular(scaledSize))
        case .bold:
            fonted = font(.bold(scaledSize))
        case .medium:
            fonted = font(.medium(scaledSize))
        }
        
        let lineHeight: CGFloat = scaledLineHeight ?? UIFont.systemFont(ofSize: scaledSize).lineHeight
        let remained =  scaledSize - lineHeight
        
        return fonted
            .lineSpacing(remained)
            .padding(.vertical, remained / 2)
            .foregroundStyle(color)
    }
    
    func scaledFont(_ type: Font.WeightType, size: CGFloat, color: Color) -> Text {
        let fonted: Text
        let scaledSize: CGFloat
        
        if UIDevice.current.isPhone {
            scaledSize = size
        } else {
            scaledSize = size * 2
        }
        
        switch type {
        case .regular:
            fonted = font(.regular(scaledSize))
        case .bold:
            fonted = font(.bold(scaledSize))
        case .medium:
            fonted = font(.medium(scaledSize))
        }
        
        
        return fonted
            .foregroundColor(color)
    }
}

