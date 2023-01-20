//
//  MainCoordinator.swift
//  Products Viewer
//
//  Created by Bashayer on 15/12/2022.
//

import Foundation
import UIKit
class MainCoordinator : Coordinator {
    var coordinators = [Coordinator]()
    var uiNavController: UINavigationController
    init(uiNavController: UINavigationController) {
        self.uiNavController = uiNavController
    }
    func start() {
        
       /* let vc = ViewController.instantiateWithViewModel(rootViewModel: ProductsViewModel(productsService: NetworkModel()))
        vc.coordinator = self
    
        uiNavController.pushViewController(vc, animated: false)*/
    }
   
}
