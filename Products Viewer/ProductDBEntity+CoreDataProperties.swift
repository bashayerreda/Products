//
//  ProductDBEntity+CoreDataProperties.swift
//  
//
//  Created by Bashayer on 20/12/2022.
//
//

import Foundation
import CoreData


extension ProductDBEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductDBEntity> {
        return NSFetchRequest<ProductDBEntity>(entityName: "ProductDBEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var image_url: String?
    @NSManaged public var price: String?

}

