//
//  AsyncImageView.swift
//  LearningSwiftUI
//
//  Created by Gerlandio Lucena on 10/10/21.
//

import Foundation
import SwiftUI
import Combine

struct AsyncImageView: View {
    private let url: URL
    var maximumSize: CGFloat = 120
    @ObservedObject var binder = ImageLoader()
    
    init(url: URL) {
        self.url = url
    }
    
    var body: some View {
        VStack {
            if binder.image != nil {
                Image(uiImage: binder.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if binder.isLoading {
                loadingIndicator
            } else {
                Image(systemName: "photo.fill")
                    .onTapGesture {
                        self.binder.load(url: url)
                    }
            }
        }
        .frame(width: maximumSize, height: maximumSize, alignment: .center)
        .background(.black)
        .foregroundColor(.gray)
        .onAppear { self.binder.load(url: url) }
        .onDisappear { self.binder.cancel() }
    }
    
    private var loadingIndicator: some View {
        SpinnerLoading(style: .medium)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}

struct AsyncWebImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(url: URL(string: "https://i.imgur.com/A8Froz6.png")!)
    }
}
