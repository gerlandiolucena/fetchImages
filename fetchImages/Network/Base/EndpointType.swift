//
//  EndpointType.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 12/03/22.
//

import Foundation

public typealias HttpHeaders = [String:String]
public typealias Parameters = [String:Any]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters:Parameters?,
                           urlParameters:Parameters?)
    
    case requestParametersAndHeader(bodyParameters:Parameters?,
                                    urlParameters:Parameters?,
                                    additionalHeader:HttpHeaders?)
}

public enum HTTPMethod:String {
    case get    = "GET"
}

extension EndPointType {
    var baseUrl:URL {
        fatalError(String.Error.baseURLFail)
    }
    
    var hasDomain:Bool {
        return false
    }
    
    var headers:HttpHeaders? {
        return ["Authorization": "Bearer ",
            "Ocp-Apim-Subscription-Key": ""]
    }
    
}

protocol EndPointType {
    var baseUrl: URL { get }
    var path: String { get }
    var task: HTTPTask { get }
    var hasDomain: Bool { get }
    var headers: HttpHeaders? { get }
    var httpMethod: HTTPMethod { get }
}

