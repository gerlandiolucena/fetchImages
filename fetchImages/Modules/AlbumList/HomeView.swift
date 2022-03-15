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
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ImageViewList(results: model.albumImages?.images ?? [], isLoading: model.isLoading)
                .searchable(text: $searchText)
                .onChange(of: searchText) { newValue in
                    if newValue.count >= 3 {
                        model.fetchAlbum(searchText: newValue)
                    }
                }
            }.overlay(content: {
                if model.isLoading {
                    loadingIndicator
                }
            })
            .padding(0)
            .navigationTitle(Text("Imgur"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var loadingIndicator: some View {
        SpinnerLoading(style: .medium)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}

struct ImageViewList: View {
    var results: [ImageAlbum]
    var isLoading: Bool
    
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 120)), count: 3)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: items, spacing: 4) {
                ForEach(results, id: \.id) { image in
                    if let url = URL(string: image.link) {
                        AsyncImageView(url: url)
                            .cornerRadius(8)
                    }
                }
            }
            if isLoading {
                loadingIndicator
            }
        }
    }
    
    private var loadingIndicator: some View {
        SpinnerLoading(style: .medium, color: .white)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
