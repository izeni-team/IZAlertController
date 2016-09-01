//
//  IZAlertAction.swift
//  IZAlertController
//
//  Created by Taylor Allred on 8/16/16.
//  Copyright © 2016 Izeni. All rights reserved.
//

import Foundation
import UIKit

protocol IZAlertAction {
    var title: String? { get }
    var callback: (() -> ())? { get }
    
    init(title: String?, callback: (() -> ())?)
}