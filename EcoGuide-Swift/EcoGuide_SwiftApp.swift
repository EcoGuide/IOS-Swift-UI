//
//  EcoGuide_SwiftApp.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 6/11/2023.
//

import SwiftUI
import Firebase
@main
struct EcoGuide_SwiftApp: App {
    let persistenceController = PersistenceController.shared
    let guideViewModel = GuideViewModel()
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            HomeViewGuide(guideViewModel: guideViewModel)
               
        }
    }
}
