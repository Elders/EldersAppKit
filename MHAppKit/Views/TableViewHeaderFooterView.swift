//
//  TableViewHeaderFooterView.swift
//  MHAppKit
//
//  Created by Milen Halachev on 16.05.18.
//  Copyright © 2018 Milen Halachev. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import Foundation
import UIKit

open class TableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    //Overrides the UITableViewHeaderFooterView textLabel in order to provide IBOutlet reference.
    private var _customTextLabel: UILabel?
    @IBOutlet open override var textLabel: UILabel? {
        
        get {
            
            return _customTextLabel
        }
        
        set {
            
            _customTextLabel = newValue
        }
    }
    
    //Overrides the UITableViewHeaderFooterView detailTextLabel in order to provide IBOutlet reference.
    private var _customDetailTextLabel: UILabel?
    @IBOutlet open override var detailTextLabel: UILabel? {
        
        get {
            
            return _customDetailTextLabel
        }
        
        set {
            
            _customDetailTextLabel = newValue
        }
    }
    
    @IBInspectable open var backgroundViewColor: UIColor? {
        
        get {
            
            return self.backgroundView?.backgroundColor
        }
        
        set {
            
            self.backgroundView = self.backgroundView ?? UIView()
            self.backgroundView?.backgroundColor = newValue
        }
    }
}
#endif
