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
    
    
    static func postFavorites(favorite: AllElements, completion: @escaping (Result <Bool, AppError>) -> ()) {
        
        let endpointURLString = "http://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: endpointURLString) else {
            completion(.failure(.badURL(endpointURLString)))
            return
        }
        // convert favorite button pressed to data
        do {
            let data = try JSONEncoder().encode(favorite)
            
            // configure our URLRequest
            // url
            var request = URLRequest(url: url)
            
            // type of http method
            request.httpMethod = "POST"
            
            // type of data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // provide data being sent to web api
            request.httpBody = data
            
            // execute POST request
            // either our completion captures Data or an AppError
            NetworkHelper.shared.performDataTask(with: request) { (result) in
                switch result {
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                case .success:
                    completion(.success(true))
                }
            }
        } catch {
            completion(.failure(.encodingError(error)))
        }
    }

    
    // GET request: to get all favorites
    static func fetchFavorites(completion: @escaping(Result<[AllElements],AppError>) -> ()) {
        let answersURLString = "http://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        guard let url = URL(string: answersURLString) else {
            completion(.failure(.badURL(answersURLString)))
            return
        }
        
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) {(result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let answers = try JSONDecoder().decode([AllElements].self, from: data)
                    completion(.success(answers))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    
    
    
}
