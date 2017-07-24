//
//  UINavigationController+Background.swift
//  MHAppKit
//
//  Created by Milen Halachev on 3/3/16.
//  Copyright © 2016 Milen Halachev. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    private static let backgroundViewTag = "UINavigationController.backgroundViewTag".hashValue
    private static let backgroundImageViewTag = "UINavigationController.backgroundImageViewTag".hashValue
    
    open var backgroundView: UIView {

        if let backgroundView = self.view.viewWithTag(type(of: self).backgroundViewTag) {
            
            return backgroundView
        }
        
        let backgroundView = UIView()
        backgroundView.tag = type(of: self).backgroundViewTag
        backgroundView.clipsToBounds = true
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.frame = self.view.bounds
        
        self.view.insertSubview(backgroundView, at: 0)
        
        return backgroundView
    }
    
    open var backgroundImageView: UIImageView {
        
        if let backgroundImageView = self.backgroundView.viewWithTag(type(of: self).backgroundImageViewTag) as? UIImageView {
            
            return backgroundImageView
        }
        
        let backgroundImageView = UIImageView()
        backgroundImageView.tag = type(of: self).backgroundImageViewTag
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImageView.frame = self.backgroundView.bounds
        
        let overlayView = UIView()
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlayView.frame = self.backgroundView.bounds
        
        self.backgroundView.addSubview(backgroundImageView)
        self.backgroundView.addSubview(overlayView)
        
        return backgroundImageView
    }
}
