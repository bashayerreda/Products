//
//  MerchantProduct.swift
//  Products Viewer
//
//  Created by Bashayer on 13/12/2022.
//

import Foundation
import UIKit
struct MerchantProduct : Decodable {
    var id , price , upc , sku , buy_url , discount_percent , unit_price  : String?
}
