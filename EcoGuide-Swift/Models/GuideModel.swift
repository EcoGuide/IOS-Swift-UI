//
//  GuideModel.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 13/11/2023.
//

import Foundation

struct Guide: Identifiable, Codable {
    var id: UUID = UUID() // Add a unique identifier

    var name: String
    var location: String
    var imageName: String
    var description: String
    var reviews: String
    var price: String
}


//struct fetchGuideReviews : Codable {
//    let statusCode : Int
//    let message : String
//    let guide : Guide
//}


struct fetchGuidesResponse : Decodable {
    let guide : [Guide]
    let message : String
    let statusCode : Int
}
