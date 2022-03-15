//
//  UIViewControllerExtension.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 14/03/22.
//

import UIKit

extension UIViewController {
    static var named: String {
        return String(describing: self)
    }
}

//TODO: O objetivo é exportar cada extensão para um arquivo dedicado, quando a complexidade exigir
extension UIView {
    static var named: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withReuseIdentifier: T.named, for: indexPath) as? T
    }
}
