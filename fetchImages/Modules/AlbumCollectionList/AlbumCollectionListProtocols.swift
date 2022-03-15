//
//  AlbumCollectionListProtocols.swift
//  fetchImages
//
//  Created Gerlandio Lucena on 14/03/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

//MARK: Wireframe -
protocol AlbumCollectionListWireframeProtocol: AnyObject {
}

// MARK: - Interactor

protocol AlbumCollectionListInteractorInputProtocol {
    func request(term: String, completionHandler: @escaping (Result<ImageSearchResult, NetworkError>) -> Void)  
}

// MARK: - Presenter

protocol AlbumCollectionListPresenterInputProtocol: AnyObject {
    var imageResult: ImageSearchResult? { get }
    func fetchAlbum(with term: String)
}

// MARK: - View

protocol AlbumCollectionListPresenterOutputProtocol: AnyObject {
    func reloadData()
    func showError()
}
