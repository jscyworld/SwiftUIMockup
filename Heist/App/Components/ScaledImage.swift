//
//  ScaledImage.swift
//  Heist
//
//  Created by Sirius_Haii on 11/25/25.
//

import SwiftUI

struct ScaledImage: View {
    
    // MARK: - Properties
    
    let resource: ImageResource
    let tintEnabled: Bool
    let tintColor: Color?
    
    init(resource: ImageResource, tintEnabled: Bool = false, tintColor: Color? = nil) {
        self.resource = resource
        self.tintEnabled = tintEnabled
        self.tintColor = tintColor
    }
    
    
    // MARK: - UI
    
    var body: some View {
        let baseImage = Image(resource)
        let image: some View = baseImage
            .resizable()
            .aspectRatio(contentMode: .fit)
        
        Group {
            if tintEnabled {
                Image(resource)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(tintColor ?? .primary)
            } else {
                image
            }
        }
        .frame(width: imageSize.width, height: imageSize.height)
    }
}

extension ScaledImage {
    
    var imageSize: CGSize {
        let image = UIImage(resource: resource)
        
        if UIDevice.current.isPhone {
            return image.size
        } else {
            return .init(width: image.size.width * 2, height: image.size.height * 2)
        }
    }
    
}


