//
//  AlbumCollectionListView.swift
//  fetchImages
//
//  Created Gerlandio Lucena on 14/03/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class AlbumCollectionListView: UIViewController, AlbumCollectionListPresenterOutputProtocol {
   
	var presenter: AlbumCollectionListPresenterInputProtocol?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var errorView: UIView!
    private var searchText: String? {
        didSet {
            guard let term = searchText else { return }
            presenter?.fetchAlbum(with: term)
        }
    }
    private var dataSource: AlbumColletionDataSource?
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchAlbum(with: "demon slayer")
    }
    
    func reloadData() {
        errorView.isHidden = true
        dataSource = AlbumColletionDataSource(list: presenter?.imageResult?.images ?? [])
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    func showError() {
        errorView.isHidden = false
    }
}

extension AlbumCollectionListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let imageViewCell = cell as? ImageViewCell {
            imageViewCell.viewDidUnload()
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width / 3) - 4.0, height: 140)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }
}

extension AlbumCollectionListView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text?.count ?? 0) >= 3 {
            self.searchText = searchBar.text ?? ""
        }
        searchBar.resignFirstResponder()
    }
}
