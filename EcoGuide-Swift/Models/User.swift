//
//  User.swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-15.
//

import Foundation
class user: Identifiable, ObservableObject {
    @Published var firstName: String
    @Published var lastName: String
    @Published var phoneNumber: String
    @Published var email: String

    init(firstName: String, lastName: String, phoneNumber: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
