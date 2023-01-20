//
//  Coordinator.swift
//  Products Viewer
//
//  Created by Bashayer on 15/12/2022.
//

import Foundation
import UIKit
protocol Coordinator {
    var coordinators :[Coordinator]{get set}
    var uiNavController : UINavigationController {get set}
    func start()
}
