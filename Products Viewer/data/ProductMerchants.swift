//
//  ProductMerchants.swift
//  Products Viewer
//
//  Created by Bashayer on 13/12/2022.
//

import Foundation
import UIKit
struct ProductMerchants : Decodable{
    var merchant : Merchant?
    var merchantProduct : MerchantProduct?
    var productMerchant : ProductMerchant?
     
    
    
    enum CodingKeys : String , CodingKey{
        case merchant = "Merchant"
        case merchantProduct = "MerchantProduct"
        case productMerchant = "ProductMerchant"
    }
}
