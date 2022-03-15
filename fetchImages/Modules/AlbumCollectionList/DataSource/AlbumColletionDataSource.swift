//
//  AlbumColletionDataSource.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 14/03/22.
//

import Foundation
import UIKit

class AlbumColletionDataSource: NSObject, UICollectionViewDataSource {
    var listAlbumImage: [ImageAlbum]
    
    init(list: [ImageAlbum]) {
        self.listAlbumImage = list
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listAlbumImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: ImageViewCell =  collectionView.dequeue(indexPath: indexPath) {
            if let urlFinal = URL(string: listAlbumImage[indexPath.item].link) {
                cell.setupImage(from: urlFinal)
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
}
