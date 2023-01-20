//
//  SideNavigationController.swift
//  Products Viewer
//
//  Created by Bashayer on 18/12/2022.
//

import Foundation
import UIKit
import ENSwiftSideMenu
class sideNavigationController : ENSideMenuNavigationController {
    override func viewDidLoad() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewController(withIdentifier: "Menu") as! SubViewTableViewController
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: menu, menuPosition: ENSideMenuPosition.left)
        sideMenu?.menuWidth = 180
        view?.bringSubviewToFront(navigationBar)
        
        
    }
}
