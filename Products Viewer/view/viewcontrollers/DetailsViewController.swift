//
//  DetailsViewController.swift
//  Products Viewer
//
//  Created by Bashayer on 14/12/2022.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa
import AlamofireImage
import Alamofire

class DetailsViewController: UIViewController  {
    
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    
    var productNameText = ""
    var productNameImg = " "
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productName.text = self.productNameText
        AF.request(self.productNameImg).responseImage { response in
            if(response.data != nil){
                
                let img = UIImage(data: response.data!, scale: 3.0) ?? UIImage(named: "t")
                let imageCache = AutoPurgingImageCache()
                if(img != nil){
                    imageCache.add(img!, withIdentifier: self.productNameImg)
                    
                    DispatchQueue.main.async {
                        self.productImg.image = img
                        
                    }
                }
            }
        }
                    
       // share.addTarget(self, action: #selector(shareItem(sender:)), for: .allEvents)
      
        
        }
  
      
    @objc func shareItem(sender:UIView){
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let textToShare =  URL(string: self.productNameImg)
        let objectsToShare = [textToShare!, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        
        //Excluded Activities
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        //
        
        activityVC.popoverPresentationController?.sourceView = sender
        self.present(activityVC, animated: true, completion: nil)
    }
    
   
    }
    


    

