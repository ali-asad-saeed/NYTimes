//
//  NYTimesClient.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation


protocol NYTimesClient {
    func sendRequest<T: Decodable>(
        endpoint: NYTimesEndpoint,
        responseModel: T.Type,
        completionHandler: @escaping (Result<T, NYTimesReqError>)->())
}

extension NYTimesClient {
    func sendRequest<T: Decodable>(
        endpoint: NYTimesEndpoint,
        responseModel: T.Type,
        completionHandler: @escaping (Result<T, NYTimesReqError>)->() ) {
            var urlComponents = URLComponents()
            urlComponents.scheme = endpoint.scheme
            urlComponents.host = endpoint.host
            urlComponents.path = endpoint.path
            urlComponents.queryItems = endpoint.queryItems
            
            guard let url = urlComponents.url else {
                completionHandler(.failure(.invalidURL))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = endpoint.method.rawValue
            request.allHTTPHeaderFields = endpoint.header
            
            if let body = endpoint.body {
                request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let response = response as? HTTPURLResponse, let data = data else {
                    completionHandler(.failure(.noResponse))
                    return
                }
                switch response.statusCode {
                case 200...299:
                    guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                        completionHandler(.failure(.decode))
                        return
                    }
                    return completionHandler(.success(decodedResponse))
                case 401:
                    completionHandler(.failure(.unauthorized))
                default:
                    completionHandler(.failure(.unexpectedStatusCode))
                }
            }
            
            task.resume()
        }
}
