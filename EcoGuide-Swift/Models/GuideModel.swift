//
//  GuideModel.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 13/11/2023.
//

import Foundation

struct Guide : Decodable {
   // var id: Int
    var _id = UUID()
    var name: String
    var location: String
    var imageName: String
    var description: String
    var reviews: String
    var price: String
    //var user : User
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
