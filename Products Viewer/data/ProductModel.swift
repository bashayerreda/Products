//
//  ProductModel.swift
//  Products Viewer
//
//  Created by Bashayer on 19/12/2022.
//

import Foundation
import CoreData

class ProductModel : NSManagedObject {
    @NSManaged var id , name  , price , unit_price, product_type_id ,shopping_list_item_id,shopping_cart_item_id, image_url : String
    
}
