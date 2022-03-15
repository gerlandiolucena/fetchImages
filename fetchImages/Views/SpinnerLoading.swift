//
//  SpinnerLoading.swift
//  SwiftUILearning
//
//  Created by Gerlandio Lucena on 12/07/21.
//

import SwiftUI
import UIKit

struct SpinnerLoading: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    var color: UIColor = .gray
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        spinner.color = color
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
