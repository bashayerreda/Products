//
//  Storyboarded.swift
//  Products Viewer
//
//  Created by Bashayer on 15/12/2022.
//

import Foundation
import UIKit
protocol Storyboarded {
    var rootViewModel : ProductsViewModel! { get set}
    static func instantiate() -> Self
 static func instantiateWithViewModel(rootViewModel : ProductsViewModel) -> ViewController
}
extension Storyboarded where Self : UIViewController{
      
   
    static func instantiate() -> Self{
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id)
        as! Self
    }
    
     
}
