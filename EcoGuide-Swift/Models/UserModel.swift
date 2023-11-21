//
//  UserModel.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 21/11/2023.
//

import Foundation

struct UserModel: Codable, Hashable {
    var _id: String
    var name: String
    var email: String
    var telephone: String
}
