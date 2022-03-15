//
//  EndpointType.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 12/03/22.
//

import Foundation

public typealias HttpHeaders = [String:String]
public typealias Parameters = [String:Any]

public typealias HTTPTask = (bodyParameters: Parameters?, urlParameters: Parameters?)

public enum HTTPMethod:String {
    case get = "GET"
}

protocol EndPointType {
    var baseUrl: URL { get }
    var path: String { get }
    var task: HTTPTask { get }
    var headers: HttpHeaders? { get }
    var httpMethod: HTTPMethod { get }
}

extension EndPointType {
    var baseUrl: URL {
        fatalError(String.Error.baseURLFail)
    }
    
    var headers:HttpHeaders? {
        return ["Authorization": "Client-ID 1ceddedc03a5d71"]
    }
}
