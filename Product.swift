//
//  Product.swift
//  Youtube MVVM Product
//
//  Created by SMITA BHUTKA on 27/02/24.
//

import Foundation

struct Product: Decodable {
    
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rate //Array
    
}

struct Rate: Decodable {
    let rate : Float
    let count: Int
}
