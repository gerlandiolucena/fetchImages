//
//  AlbumCollectionListView.swift
//  fetchImages
//
//  Created Gerlandio Lucena on 14/03/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class AlbumCollectionListView: BaseViewController, AnalyticController, UIController, AlbumCollectionListPresenterOutputProtocol {

    var screenName: AnalyticsScreenName {
        return AnalyticsScreenName.AlbumCollectionList
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    var backgroundColor: UIColor {
        return UIColor.B2B.pretoXP
    }
    
    var navigationTitle: String {
        return "AlbumCollectionList"
    }
    
	var presenter: AlbumCollectionListPresenterInputProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

}
