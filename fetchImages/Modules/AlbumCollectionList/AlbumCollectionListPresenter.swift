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

    init(view: AlbumCollectionListPresenterOutputProtocol,
        interactor: AlbumCollectionListInteractorInputProtocol,
        wire: AlbumCollectionListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wire
    }

}
