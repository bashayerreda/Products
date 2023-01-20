//
//  ProductsData.swift
//  Products Viewer
//
//  Created by Bashayer on 13/12/2022.
//

import Foundation
struct ProductsData : Decodable {
    var product : Product?
    var productMerchants : [ProductMerchants]?
    
    
    enum CodingKeys : String , CodingKey{
        case product = "Product"
        case productMerchants = "ProductMerchants"
    }
}
