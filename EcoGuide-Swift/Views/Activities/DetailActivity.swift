//
//  DetailActivity.swift
//  EcoGuide-Swift
//
//  Created by Copper_Orka on 9/11/2023.
//

import SwiftUI

struct ActInfo : Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var imageName: String
    var description: String
    var reviews: String
    var budget: String
    var season: String
    var participants: String

}

struct DetailActivity: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailActivity_Previews: PreviewProvider {
    static var previews: some View {
        DetailActivity()
    }
}
