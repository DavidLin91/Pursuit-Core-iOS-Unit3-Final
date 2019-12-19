//
//  ElementsAPIClient.swift
//  Elements
//
//  Created by David Lin on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ElementsAPIClient {
static func getElements(completion: @escaping(Result<[AllElements], AppError>)-> ()) {
    
    
    let endpointURL = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
    
    
    guard let url = URL(string: endpointURL) else {
        completion(.failure(.badURL(endpointURL)))
        return
    }
    
    let request = URLRequest(url: url)
    var element = [AllElements]()
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
        switch result {
        case .failure(let appError):
            completion(.failure(.networkClientError(appError)))
        case .success(let data):
            do{
                let elementData = try JSONDecoder().decode([AllElements].self, from: data)
                element = elementData
                completion(.success(element))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
    }
}
}
