//
//  Model.swift
//  web and craft
//
//  Created by Ann Antony on 20/10/24.
//

import Foundation

struct WebAPIResponse: Decodable, Identifiable{
    
    var type: String?
    var title: String?
    var contents: [ContentListResponse]?
    var id: String?
    var image_url : String?
}

struct ContentListResponse : Decodable {
    var title: String?
    var image_url: String?
    var sku: String?
    var product_name: String?
    var product_image: String?
    var product_rating: Int?
    var actual_price: String?
    var offer_price: String?
    var discount:String?
}


