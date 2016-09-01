//
//  viewController.swift
//  IZAlertController
//
//  Created by Taylor Allred on 8/29/16.
//  Copyright © 2016 Izeni. All rights reserved.
//

import UIKit

class IZAlertActionClass: IZAlertAction {
    var title: String?
    var callback: (() -> ())?
    required init(title: String?, callback: (() -> ())?) {
        self.title = title
        self.callback = callback
    }
    
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let view = IZAlertViewController<IZAlertActionClass>(title: "TEST", message: "THIS IS A MESSAGE!!")
        
        view.addAction(IZAlertActionClass(title: "First Button", callback: {
            print("FIRST BUTTON PRESSED!!")
        }))
        view.addAction(IZAlertActionClass(title: "Second Button", callback: {
            print("SECOND BUTTON PRESSED!!")
        }))
        view.addAction(IZAlertActionClass(title: "Third Button", callback: {
            print("THIRD BUTTON PRESSED!!")
        }))
        
        self.presentViewController(view, animated: true, completion: nil)
    }
}