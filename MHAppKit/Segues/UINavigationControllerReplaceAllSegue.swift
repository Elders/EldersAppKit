//
//  UINavigationControllerReplaceAllSegue.swift
//  MHAppKit
//
//  Created by Milen Halachev on 2/13/15.
//  Copyright (c) 2015 Milen Halachev. All rights reserved.
//

import UIKit

///A segue that replaces the view controllers of the source's navigation controler with the destination only
open class UINavigationControllerReplaceAllSegue: UIStoryboardSegue {
    
    open override func perform() {
        
        let source = self.source
        let destination = self.destination
        
        if let navigation = source.navigationController {
            
            let controllers = [destination]
            navigation.setViewControllers(controllers, animated: true)
        }
    }
}
