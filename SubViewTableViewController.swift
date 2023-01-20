//
//  SubViewTableViewController.swift
//  Products Viewer
//
//  Created by Bashayer on 18/12/2022.
//

import UIKit

class SubViewTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var destinationVc : UIViewController!
        if indexPath.row == 1 {
            destinationVc = storyboard.instantiateViewController(withIdentifier: "vc2") as! tableViewController
           
        }
        else {
            destinationVc = storyboard.instantiateViewController(withIdentifier: "vc1") as!  ViewController
        }
           
        
        sideMenuController()?.setContentViewController(destinationVc)
    }
}
