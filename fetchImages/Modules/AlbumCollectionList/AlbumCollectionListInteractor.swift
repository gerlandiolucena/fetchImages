//
//  AlbumCollectionListInteractor.swift
//  fetchImages
//
//  Created Gerlandio Lucena on 14/03/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

enum NetworkError: Error {
    case noResult
}

class AlbumCollectionListInteractor: BaseRequest<ImageSearchAPI, ImageSearchResult>, AlbumCollectionListInteractorInputProtocol {

    func request(term: String, completionHandler: @escaping (Result<ImageSearchResult, NetworkError>) -> Void) {
        setupRequest(endpoint: .search(term: term))
        self.cancellable = publisher?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { errorReceive in
                print(errorReceive)
            }, receiveValue: { imageResult in
                if let result = imageResult {
                    completionHandler(.success(result))
                } else {
                    completionHandler(.failure(NetworkError.noResult))
                }
            })
    }
}
