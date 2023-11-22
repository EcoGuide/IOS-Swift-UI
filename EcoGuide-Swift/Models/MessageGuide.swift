//
//  MessageGuide.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 7/11/2023.
//

import Foundation

struct Message: Identifiable,Codable{
    var id: String
    var text:String
    var recieved: Bool
    var timestamp: Date
    
    
    
    
}
