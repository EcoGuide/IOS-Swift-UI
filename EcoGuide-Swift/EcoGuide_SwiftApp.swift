//
//  EcoGuide_SwiftApp.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 6/11/2023.
//

import SwiftUI
import Firebase
import Stripe
@main
struct EcoGuide_SwiftApp: App {
    let persistenceController = PersistenceController.shared
    let hotelViewModel = HotelViewModel()
    let guideViewModel = GuideViewModel()
    init(){
            FirebaseApp.configure()
            StripeAPI.defaultPublishableKey = "sk_test_51Mj1RqKr1MFAGF6lIsZYT42zfVuWvKFOtTCKrKcgpta2xLO7dJKXrYTcwQ0UEaar7dDgJ3OeDEg9F4Oqk253LhKg00KETz89K7"
        }
    var body: some Scene {
        WindowGroup {
            //HomeAndHotelViews(hotelViewModel: hotelViewModel)
            HomeViewGuide(guideViewModel: guideViewModel)

        }
    }
}
