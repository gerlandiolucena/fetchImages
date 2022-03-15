//
//  StoryboardExtension.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 14/03/22.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>() -> T? {
        return self.instantiateViewController(withIdentifier: T.named) as? T
    }
}
