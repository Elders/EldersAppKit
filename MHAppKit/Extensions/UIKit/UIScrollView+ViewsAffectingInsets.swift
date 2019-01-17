//
//  UIScrollView+ViewsAffectingInsets.swift
//  MHAppKit
//
//  Created by Milen Halachev on 17.01.19.
//  Copyright © 2019 Milen Halachev. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    @IBOutlet var viewsAffectingTopInsets: [UIView] {
        
        get { return [] }
        set {
            
            self.contentInset.top += newValue.reduce(0, { $0 + $1.bounds.size.height })
        }
    }
    
    @IBOutlet var viewsAffectingBottomInsets: [UIView] {
        
        get { return [] }
        set {
            
            self.contentInset.bottom += newValue.reduce(0, { $0 + $1.bounds.size.height })
        }
    }
}
