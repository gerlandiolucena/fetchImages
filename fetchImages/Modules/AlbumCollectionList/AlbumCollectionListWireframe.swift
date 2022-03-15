//
//  AlbumCollectionListWireframe.swift
//  fetchImages
//
//  Created Gerlandio Lucena on 14/03/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class AlbumCollectionListWireframe: NSObject,  AlbumCollectionListWireframeProtocol {
    
    // MARK: - Constants
    
    private let storyBoardName = "Main"
    
    // MARK: - Viper Module Properties
    
    weak var view: AlbumCollectionListView!
    
    // MARK: - Constructors
    
    override init() {
        super.init()
        
        let view = self.viewControllerFromStoryboard()
        let interactor = AlbumCollectionListInteractor()
        let presenter = AlbumCollectionListPresenter(view: view, interactor: interactor, wire: self)
        
        view.presenter = presenter
        
        self.view = view
    }
    
    // MARK: - Private methods
    
    private func viewControllerFromStoryboard() -> AlbumCollectionListView {
        let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
        let viewController: AlbumCollectionListView? = storyboard.instantiateViewController()
        
        return viewController ?? AlbumCollectionListView()
    }
}
