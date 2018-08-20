//
//  DatePickerViewController.swift
//  MHAppKit
//
//  Created by Milen Halachev on 15.08.18.
//  Copyright © 2018 Milen Halachev. All rights reserved.
//

import Foundation
import UIKit

open class DatePickerViewController: UIViewController {
    
    private static let backgroundViewTag = "DatePickerViewController.backgroundViewTag".hashValue
    
    @IBOutlet open var datePickerView: UIDatePicker!
    @IBOutlet open var toolBar: UIToolbar!
    @IBOutlet open var cancelBarButton: UIBarButtonItem!
    @IBOutlet open var titleBarButton: UIBarButtonItem!
    @IBOutlet open var doneBarButton: UIBarButtonItem!
    
    open var didSelectDate: ((_ controller: DatePickerViewController, _ date: Date?) -> Void)?
    open var viewDidLoadConfiguration: ((DatePickerViewController) -> Void)?
    
    //MARK: - Init

    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.modalPresentationStyle = .overCurrentContext
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.modalPresentationStyle = .overCurrentContext
    }
    
    //MARK: UIViewController
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.cancelBarButton.title = NSLocalizedString("Cancel", comment: "");
        self.titleBarButton.title = self.title
        self.doneBarButton.title = NSLocalizedString("Done", comment: "");
        
        if let color = self.titleBarButton.tintColor {
            
            self.titleBarButton.setTitleTextAttributes([.foregroundColor: color], for: .normal)
            self.titleBarButton.setTitleTextAttributes([.foregroundColor: color], for: .disabled)
        }
        
        self.viewDidLoadConfiguration?(self)
    }
    
    open override var preferredStatusBarStyle : UIStatusBarStyle {
        
        return .lightContent
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.transitionCoordinator?.animate(alongsideTransition: { (ctx) -> Void in
            
            let container = ctx.containerView
            
            let backgroundView = UIView(frame: container.bounds)
            backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            backgroundView.tag = type(of: self).backgroundViewTag
            container.insertSubview(backgroundView, at: 0)
            
            backgroundView.alpha = 0
            backgroundView.alpha = 1
            
        }, completion: { (ctx) -> Void in
            
        })
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        self.transitionCoordinator?.animate(alongsideTransition: { (ctx) -> Void in
            
            let container = ctx.containerView
            let backgroundView = container.viewWithTag(type(of: self).backgroundViewTag)
            backgroundView?.alpha = 0
            
        }, completion: { (ctx) -> Void in
            
            let container = ctx.containerView
            let backgroundView = container.viewWithTag(type(of: self).backgroundViewTag)
            backgroundView?.removeFromSuperview()
        })
    }
    
    //MARK: - Actions
    
    @IBAction open func cancelAction(_ sender: Any?) {
        
        self.didSelectDate?(self, nil)
    }
    
    @IBAction open func doneAction(_ sender: Any?) {
        
        self.didSelectDate?(self, self.datePickerView.date)
    }
}
