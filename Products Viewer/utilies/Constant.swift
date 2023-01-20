//
//  Constant.swift
//  Products Viewer
//
//  Created by Bashayer on 13/12/2022.
//

import Foundation
import UIKit
struct Constants {
static let BASE_URL = "https://www.nweave.com/wp-content/uploads/2012/09/featured.txt"
struct Alert {
        func showAlerts(title : String, message: String, vc : UIViewController){
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.destructive, handler: nil))
            vc.present(alert, animated: true, completion: nil)
            
            
        }
    }
}
