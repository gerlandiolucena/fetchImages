//
//  AsynImageView.swift
//  LearningSwiftUI
//
//  Created by Gerlandio Lucena on 10/10/21.
//

import Foundation
import Combine
import UIKit

class ImageLoader: ObservableObject {
    private var subscription: AnyCancellable?
    private var cache = ImageCache()
    
    @Published private(set) var image: UIImage? {
        didSet {
            isLoading = false
        }
    }
    
    @Published var isLoading = true
    
    func load(url: URL) {
        
        if let image = cache[url] {
            subscription = Just(image).assign(to: \.image, on: self)
            return
        }
        
        isLoading = true
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 8.0)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        subscription = session.dataTaskPublisher(for: request)
            .map { UIImage(data: $0.data) }
            .replaceError(with: UIImage(systemName: "arrow.triangle.2.circlepath.camera") )
            .handleEvents(receiveOutput: {[weak self] uiImage in
                guard let image = uiImage else { return }
                self?.cache[url] = image
            })
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        subscription?.cancel()
    }
}
