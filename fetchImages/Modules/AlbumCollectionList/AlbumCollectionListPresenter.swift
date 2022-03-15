//
//  AlbumCollectionListPresenter.swift
//  fetchImages
//
//  Created Gerlandio Lucena on 14/03/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class AlbumCollectionListPresenter: NSObject, AlbumCollectionListPresenterInputProtocol {

    weak private var view: AlbumCollectionListPresenterOutputProtocol?
    var interactor: AlbumCollectionListInteractorInputProtocol?
    private let wireframe: AlbumCollectionListWireframeProtocol?

    var imageResult: ImageSearchResult?
    
    init(view: AlbumCollectionListPresenterOutputProtocol,
        interactor: AlbumCollectionListInteractorInputProtocol,
        wire: AlbumCollectionListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wire
    }
    
    func fetchAlbum(with term: String) {
        interactor?.request(term: term, completionHandler: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let imageResult):
                self.imageResult = imageResult
                self.view?.reloadData()
            case .failure(_):
                self.view?.showError()
            }
        })
    }

}
