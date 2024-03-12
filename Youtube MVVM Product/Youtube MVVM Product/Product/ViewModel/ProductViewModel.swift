//
//  ProductViewModel.swift
//  Youtube MVVM Product
//
//  Created by SMITA BHUTKA on 29/02/24.
//

import Foundation
import UIKit


final class ProductViewModel {
    
    var products: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)? //Databinding Clouser
    
    func fetchProducts(){
        self.eventHandler?(.loading) // Initially loading...
        
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stoploading) // we alredy get Response so stopping loading...
            
            switch response {
            case .success(let products):
                
//                print(products)
                self.products = products
                self.eventHandler?(.dataload) // sucessfully load data

            case .failure(let error):
                self.eventHandler?(.error(error))
                print(error)
            }
        }
    }
    
 
}

extension ProductViewModel {
    
    enum Event {
        case loading
        case stoploading
        case dataload
        case error(Error?)
    }
}
