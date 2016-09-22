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
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAction(action: Action) {
        actions.append(action)
        let index = actions.count - 1
        buttons.append(createButtonFor(action: action, index: index))
    }
    
    private func createButtonFor(action: Action, index: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(action.title, for: [])
        button.tag = index
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }
    
    func buttonClicked(button: UIButton) {
        let action = actions[button.tag]
        action.callback?()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        if useExample {
            layoutExample()
            actionExample()
        }
    }
    
    private func layoutExample() {
        
        alertView = UIView()
        self.view.addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = f
        alertView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = t
        alertView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = t
        alertView.widthAnchor.constraint(equalToConstant: 300).isActive = t
        if buttons.count < 3 {
            alertView.heightAnchor.constraint(equalToConstant: 140).isActive = t
        } else {
            alertView.heightAnchor.constraint(equalToConstant: 140 + CGFloat((buttons.count - 1) * 40)).isActive = t
        }
        
        alertView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        alertView.layer.cornerRadius = 5
        
        alertView.addSubview(tL)
        tL.translatesAutoresizingMaskIntoConstraints = f
        tL.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = t
        tL.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 8).isActive = t
        tL.widthAnchor.constraint(equalToConstant: 284).isActive = t
        tL.heightAnchor.constraint(equalToConstant: 40).isActive = t
        tL.text = alertTitle
        tL.textAlignment = .center
        tL.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        tL.textColor = .black
        
        
        alertView.addSubview(mL)
        mL.translatesAutoresizingMaskIntoConstraints = f
        mL.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = t
        mL.topAnchor.constraint(equalTo: tL.bottomAnchor).isActive = t
        mL.widthAnchor.constraint(equalToConstant: 284).isActive = t
        mL.heightAnchor.constraint(equalToConstant: 40).isActive = t
        mL.text = alertMessage
        mL.textAlignment = .center
        mL.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        mL.textColor = .black
    }
    
    private func actionExample() {
        if buttons.count == 1 {
            let button = buttons[0]
            alertView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = f
            button.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = t
            button.topAnchor.constraint(equalTo: mL.bottomAnchor, constant: 8).isActive = t
            button.widthAnchor.constraint(equalToConstant: 300).isActive = t
            button.heightAnchor.constraint(equalToConstant: 40).isActive = t
            button.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.borderWidth = 0.5
            button.setTitleColor(.blue, for: [])
        } else if actions.count == 2 {
            let left = buttons[0]
            let right = buttons[1]
            alertView.addSubview(left)
            alertView.addSubview(right)
            left.translatesAutoresizingMaskIntoConstraints = f
            right.translatesAutoresizingMaskIntoConstraints = f
            left.topAnchor.constraint(equalTo: mL.bottomAnchor, constant: 8).isActive = t
            right.topAnchor.constraint(equalTo: mL.bottomAnchor, constant: 8).isActive = t
            left.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = t
            left.widthAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.5).isActive = t
            right.rightAnchor.constraint(equalTo: alertView.rightAnchor).isActive = t
            right.widthAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.5).isActive = t
            left.heightAnchor.constraint(equalToConstant: 40).isActive = t
            right.heightAnchor.constraint(equalToConstant: 40).isActive = t
            left.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            right.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            left.layer.borderColor = UIColor.gray.cgColor
            left.layer.borderWidth = 0.5
            right.layer.borderColor = UIColor.gray.cgColor
            right.layer.borderWidth = 0.5
            left.setTitleColor(.blue, for: [])
            right.setTitleColor(.blue, for: [])
        } else {
            var i = 0
            for button in buttons {
                alertView.addSubview(button)
                button.translatesAutoresizingMaskIntoConstraints = f
                button.heightAnchor.constraint(equalToConstant: 40).isActive = t
                button.widthAnchor.constraint(equalToConstant: 300).isActive = t
                button.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = t
                if i == 0 {
                    button.topAnchor.constraint(equalTo: mL.bottomAnchor).isActive = t
                } else {
                    button.topAnchor.constraint(equalTo: buttons[i - 1].bottomAnchor).isActive = t
                }
                i += 1
                
                button.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
                button.layer.borderColor = UIColor.gray.cgColor
                button.layer.borderWidth = 0.5
                button.setTitleColor(.blue, for: [])
            }
        }
    }
}
