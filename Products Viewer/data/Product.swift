//
//  Product.swift
//  Products Viewer
//
//  Created by Bashayer on 13/12/2022.
//

import Foundation
struct Product : Decodable {
    var id , name , description , price , unit_price, product_type_id ,shopping_list_item_id,shopping_cart_item_id, image_url : String?
    }
