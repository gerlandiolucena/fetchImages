//
//  ImageViewCell.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 14/03/22.
//

import Foundation
import UIKit
import Combine

class ImageViewCell: UICollectionViewCell {
    
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView! {
        didSet {
            spinner.color = .white
            spinner.startAnimating()
        }
    }
    private var imageSubscriber: AnyCancellable?
    private var imageLoader: ImageLoader?
    
    var imageURL: URL?
    
    func setupImage(from url: URL) {
        imageURL = url
        imageSubscriber?.cancel()
        imageLoader = ImageLoader()
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 8.0
        setupSubscriber()
    }
    
    func setupSubscriber() {
        guard let imageURL = imageURL else { return }
        
        spinner.startAnimating()
        imageSubscriber?.cancel()
        imageLoader?.cancel()
        imageSubscriber = imageLoader?.$image
            .sink { [weak self] uiImage in
                guard let self = self else { return }
                if let uiImage = uiImage {
                    self.spinner.stopAnimating()
                    self.currentImage.image = uiImage
                }
            }
        imageLoader?.load(url: imageURL)
    }
    
    func viewDidUnload() {
        imageSubscriber?.cancel()
        self.currentImage.image = nil
        spinner.startAnimating()
    }
}
