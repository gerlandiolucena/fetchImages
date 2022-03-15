//
//  ImageSearchResult.swift
//  fetchImages
//
//  Created by Gerlandio Lucena on 12/03/22.
//

import Foundation

// MARK: - ImageResult
struct ImageSearchResult: Decodable {
    let data: [Album]
    let success: Bool
    let status: Int
    
    var images: [ImageAlbum]? {
        var listImages = [ImageAlbum]()
        
        for album in data {
            listImages.append(contentsOf: album.images ?? [])
        }
        return listImages
    }
}

// MARK: - Datum
struct Album: Decodable, Identifiable {
    let id: String
    let title: String
    let albumDescription: String?
    let datetime: Int
    let link: String
    let ups: Int
    let downs: Int
    let score: Int
    let commentCount: Int?
    let tags: [Tag]
    let images: [ImageAlbum]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case albumDescription = "description"
        case datetime
        case link
        case ups
        case downs
        case score
        case commentCount
        case tags
        case images
    }
}

// MARK: - Image
struct ImageAlbum: Decodable {
    let id: String
    let imageDescription: String?
    let datetime: Int
    let type: String
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageDescription = "description"
        case datetime
        case type
        case link
    }
}

// MARK: - Tag
struct Tag: Decodable {
    let name: String
    let tagDescription: String?
    let displayName: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case tagDescription = "description"
        case displayName = "display_name"
    }
}
