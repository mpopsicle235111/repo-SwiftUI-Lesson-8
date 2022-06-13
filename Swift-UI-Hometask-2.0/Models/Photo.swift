//
//  Photo.swift
//  Swift-UI-Hometask-2.0
//
//  Created by Anton Lebedev on 31.05.2022.
//

import Foundation


// MARK: - PhotoContainer
struct PhotosContainer: Codable {
    let response: PhotosResponse?
    let name: String?
    let founded: Int?
    let members: [String]?
}

// MARK: - Response
struct PhotosResponse: Codable {
    let count: Int
    let items: [PhotoAPI]
}

// MARK: - Item
struct PhotoAPI: Codable, Identifiable, Equatable {
    
    //Protocol stub
    static func == (lhs: PhotoAPI, rhs: PhotoAPI) -> Bool {
        return lhs.id == rhs.id
    }
    
    let albumID, id, date: Int
    let text: String
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int
    let postID: Int?
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case postID = "post_id"
    }
}

// MARK: - Size
struct Size: Codable {
    let width, height: Int
    let url: String
    let type: String
}

// MARK: - Track
struct Track: Codable {
    let name: String
    let duration: Int
}

