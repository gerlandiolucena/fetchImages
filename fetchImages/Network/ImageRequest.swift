//
//  ImageRequest.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 12/03/22.
//

import Foundation
import Combine

enum ImageSearchAPI {
    case search(term: String)
}

extension ImageSearchAPI: EndPointType {
    
    var baseUrl: URL {
        let defaultURL = "https://api.imgur.com"
        return URL(string: defaultURL + path)!
    }
    var path: String {
        switch self {
        case .search(_):
            return "/3/gallery/search"
        }
    }
    
    var task: HTTPTask {
        switch self {
            case .search(let term):
                return (bodyParameters: nil, urlParameters: ["q": term])
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .search(_):
            return .get
        }
    }
}

class RequestImageAlbuns: BaseRequest<ImageSearchAPI, ImageSearchResult> {
    
    func request<Root>(to: ReferenceWritableKeyPath<Root, ImageSearchResult?>, on: Root, term: String) {
        setupRequest(endpoint: .search(term: term))
        self.cancellable = publisher?.receive(on: DispatchQueue.main)
            .replaceError(with: ImageSearchResult(data: [], success: false, status: 204))
            .assign(to: to, on: on)
    }
}
