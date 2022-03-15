//
//  BaseRequest.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 14/03/22.
//

import Foundation
import Combine

class BaseRequest<Endpoint: EndPointType, ResultType: Decodable> {
    var publisher: AnyPublisher<ResultType?, Error>?
    var cancellable: Cancellable?
    
    func setupRequest(endpoint: Endpoint) {
        var request = URLRequest(url: endpoint.baseUrl, timeoutInterval: 10.0)
        if var components = URLComponents(url: endpoint.baseUrl, resolvingAgainstBaseURL: true) {
            components.queryItems = []
            for element in endpoint.task.urlParameters ?? [:] {
                components.queryItems?.append(URLQueryItem(name: element.key, value: "\(element.value)"))
            }
            
            request.url = components.url
        }
        
        for header in endpoint.headers ?? [:] {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        self.publisher = session.dataTaskPublisher(for: request)
            .handleEvents(receiveOutput: {
                print(NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue)!)
            })
            .map {
                $0.data
            }
            .decode(type: ResultType.self, decoder: JSONDecoder())
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
}
