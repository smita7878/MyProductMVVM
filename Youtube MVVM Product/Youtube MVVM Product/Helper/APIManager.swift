//
//  APIManager.swift
//  Youtube MVVM Product
//
//  Created by SMITA BHUTKA on 27/02/24.
//

import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<[Product], DataError>)-> Void

//Singleton Design Pattern (
final class APIManager { // even using inheritance you ca use anything from this class without using shared)
    
    static let shared = APIManager() //single object no need to create new object during calling any property from this class
    private init() {}
    
    
    func fetchProducts(completion: @escaping Handler){
        guard let url = URL(string: Constant.API.productURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                
                completion(.failure(.invalidData))
                
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                
                return
            }
            
            //Jsondecoder will convert your data in to model(Array)
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }
            
            
        }.resume()
    }
    
    
}


//singleton - small letter (if you can use object outside of clASS)
//Singleton - capital S (cant create object outside of the class)
