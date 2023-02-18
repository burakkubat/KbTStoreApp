//
//  Model.swift
//  KbtStoreApp
//
//  Created by Burak Kubat on 18.02.2023.
//

import Foundation


struct List: Decodable{
    var products: [Products]
}

struct Products: Decodable {
    var title: String
    var description: String
    var price: Int
    var rating: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    var images: [String]
}
