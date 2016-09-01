//
//  IZAlertController.swift
//  IZAlertController
//
//  Created by Taylor Allred on 8/16/16.
//  Copyright © 2016 Izeni. All rights reserved.
//

import UIKit

class IZAlertViewController<Action: IZAlertAction>: UIViewController {
    let t = true
    let f = false
    var useExample: Bool = true
    var alertView: UIView!
    let tL = UILabel()
    var alertTitle: String?
    let mL = UILabel()
    var alertMessage: String?
    private var actions: [Action] = []
    private var buttons: [UIButton] = []
    
    init(title: String?, message: String?) {
        super.init(nibName: nil, bundle: nil)
        alertTitle = title
        alertMessage = message
        self.modalTransitionStyle = .CrossDissolve
        self.modalPresentationStyle = .OverFullScreen
    }
    
    func addAction(action: Action) {
        actions.append(action)
        let index = actions.count - 1
        buttons.append(createButtonFor(action, index: index))
    }
    
    private func createButtonFor(action: Action, index: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(action.title, forState: [])
        button.tag = index
        button.addTarget(self, action: #selector(buttonClicked), forControlEvents: .TouchUpInside)
        return button
    }
    
    func buttonClicked(button: UIButton) {
        let action = actions[button.tag]
        action.callback?()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        if useExample {
            layoutExample()
            actionExample()
        }
    }
    
    private func layoutExample() {
        
        alertView = UIView()
        self.view.addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = f
        alertView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = t
        alertView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: -40).active = t
        alertView.widthAnchor.constraintEqualToConstant(300).active = t
        if buttons.count < 3 {
            alertView.heightAnchor.constraintEqualToConstant(140).active = t
        } else {
            alertView.heightAnchor.constraintEqualToConstant(140 + CGFloat((buttons.count - 1) * 40)).active = t
        }
        
        alertView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        alertView.layer.cornerRadius = 5
        
        alertView.addSubview(tL)
        tL.translatesAutoresizingMaskIntoConstraints = f
        tL.centerXAnchor.constraintEqualToAnchor(alertView.centerXAnchor).active = t
        tL.topAnchor.constraintEqualToAnchor(alertView.topAnchor, constant: 8).active = t
        tL.widthAnchor.constraintEqualToConstant(284).active = t
        tL.heightAnchor.constraintEqualToConstant(40).active = t
        tL.text = alertTitle
        tL.textAlignment = .Center
        tL.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        tL.textColor = .blackColor()
        
        
        alertView.addSubview(mL)
        mL.translatesAutoresizingMaskIntoConstraints = f
        mL.centerXAnchor.constraintEqualToAnchor(alertView.centerXAnchor).active = t
        mL.topAnchor.constraintEqualToAnchor(tL.bottomAnchor).active = t
        mL.widthAnchor.constraintEqualToConstant(284).active = t
        mL.heightAnchor.constraintEqualToConstant(40).active = t
        mL.text = alertMessage
        mL.textAlignment = .Center
        mL.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        mL.textColor = .blackColor()
    }
    
    private func actionExample() {
        if buttons.count == 1 {
            let button = buttons[0]
            alertView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = f
            button.centerXAnchor.constraintEqualToAnchor(alertView.centerXAnchor).active = t
            button.topAnchor.constraintEqualToAnchor(mL.bottomAnchor, constant: 8).active = t
            button.widthAnchor.constraintEqualToConstant(300).active = t
            button.heightAnchor.constraintEqualToConstant(40).active = t
            button.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            button.layer.borderColor = UIColor.grayColor().CGColor
            button.layer.borderWidth = 0.5
            button.setTitleColor(.blueColor(), forState: [])
        } else if actions.count == 2 {
            let left = buttons[0]
            let right = buttons[1]
            alertView.addSubview(left)
            alertView.addSubview(right)
            left.translatesAutoresizingMaskIntoConstraints = f
            right.translatesAutoresizingMaskIntoConstraints = f
            left.topAnchor.constraintEqualToAnchor(mL.bottomAnchor, constant: 8).active = t
            right.topAnchor.constraintEqualToAnchor(mL.bottomAnchor, constant: 8).active = t
            left.leadingAnchor.constraintEqualToAnchor(alertView.leadingAnchor).active = t
            left.widthAnchor.constraintEqualToAnchor(alertView.widthAnchor, multiplier: 0.5).active = t
            right.rightAnchor.constraintEqualToAnchor(alertView.rightAnchor).active = t
            right.widthAnchor.constraintEqualToAnchor(alertView.widthAnchor, multiplier: 0.5).active = t
            left.heightAnchor.constraintEqualToConstant(40).active = t
            right.heightAnchor.constraintEqualToConstant(40).active = t
            left.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            right.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            left.layer.borderColor = UIColor.grayColor().CGColor
            left.layer.borderWidth = 0.5
            right.layer.borderColor = UIColor.grayColor().CGColor
            right.layer.borderWidth = 0.5
            left.setTitleColor(.blueColor(), forState: [])
            right.setTitleColor(.blueColor(), forState: [])
        } else {
            var i = 0
            for button in buttons {
                alertView.addSubview(button)
                button.translatesAutoresizingMaskIntoConstraints = f
                button.heightAnchor.constraintEqualToConstant(40).active = t
                button.widthAnchor.constraintEqualToConstant(300).active = t
                button.centerXAnchor.constraintEqualToAnchor(alertView.centerXAnchor).active = t
                if i == 0 {
                    button.topAnchor.constraintEqualToAnchor(mL.bottomAnchor).active = t
                } else {
                    button.topAnchor.constraintEqualToAnchor(buttons[i - 1].bottomAnchor).active = t
                }
                i += 1
                
                button.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
                button.layer.borderColor = UIColor.grayColor().CGColor
                button.layer.borderWidth = 0.5
                button.setTitleColor(.blueColor(), forState: [])
            }
        }
    }
}