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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let view = IZAlertViewController<IZAlertActionClass>(title: "TEST", message: "THIS IS A MESSAGE!!")
        
        view.addAction(action: IZAlertActionClass(title: "First Button", callback: {
            print("FIRST BUTTON PRESSED!!")
        }))
        view.addAction(action: IZAlertActionClass(title: "Second Button", callback: {
            print("SECOND BUTTON PRESSED!!")
        }))
        view.addAction(action: IZAlertActionClass(title: "Third Button", callback: {
            print("THIRD BUTTON PRESSED!!")
        }))
        
        self.present(view, animated: true, completion: nil)
    }
}
