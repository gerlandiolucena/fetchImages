//
//  ViewController.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 12/03/22.
//

import UIKit
import Combine
import SwiftUI

struct HomeView: View {
    @ObservedObject var  model = ImageSearchViewModel()
    private var request = RequestImageAlbuns()
    
    var body: some View {
        NavigationView {
            List(model.albumImages?.data ?? []) { album in
                Text(album.albumDescription ?? album.title)
            }
        }.onAppear {
            requestAlbumImages(term: "cats")
        }
    }
    
    func requestAlbumImages(term: String) {
        request.request(to: \.albumImages, on: model, term: term)
    }
}

