//
//  SceneDelegate.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 12/03/22.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let wireframe = AlbumCollectionListWireframe()
        let contentView = wireframe.view
        //Projeto feito em swiftUI
        //let contentView = HomeView()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = contentView//UIHostingController(rootView: contentView)
            //Projeto feito em swiftUI
            //window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

