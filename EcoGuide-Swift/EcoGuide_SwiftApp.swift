//
//  EcoGuide_SwiftApp.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 6/11/2023.
//

import SwiftUI

@main
struct EcoGuide_SwiftApp: App {
    let persistenceController = PersistenceController.shared
    let hotelViewModel = HotelViewModel()

    var body: some Scene {
        WindowGroup {
            HomeAndHotelViews(hotelViewModel: hotelViewModel)
               
        }
    }
}
