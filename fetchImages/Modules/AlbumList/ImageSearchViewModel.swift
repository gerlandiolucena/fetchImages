//
//  ImageSearchViewModel.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 12/03/22.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class ImageSearchViewModel: ObservableObject {
    @Published var albumImages: ImageSearchResult? {
        didSet {
            isLoading = false
        }
    }
    
    @Published var isLoading = false
    private var request = RequestImageAlbuns()
    
    func fetchAlbum(searchText: String) {
        isLoading.toggle()
        request.request(to: \.albumImages, on: self, term: searchText)
    }
}
