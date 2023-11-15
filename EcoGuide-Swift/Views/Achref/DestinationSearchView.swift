//
//  DestinationSearchView.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 13/11/2023.
//

import SwiftUI

enum DestinationSearchoptions{
    case location
    case hotelandhouseName
    case type
}

struct DestinationSearchView: View {
    var categories = ["All", "House", "Hotel"]
    @State private var selectedCategory: String = "All"
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchoptions = .location
    var body: some View {
        VStack{
            Button{
                withAnimation(.snappy) {
                    show.toggle()
                }
            }
        label:{
            Image(systemName: "xmark.circle")
                .imageScale(.large)
                .foregroundStyle(Color(hex: "196EEE"))
        }
        }
        VStack(alignment:.leading){
            if selectedOption == .location{
                Text("Where to ?")
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    
                    TextField("Search destinations",text: $destination)
                        .font(.subheadline)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color(.systemGray4))
            }
            
            }else {
                ExtractedView(title: "Where", description: "Choise destination")
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .onTapGesture {
            selectedOption = .location
        }
        VStack(alignment:.leading){
            if selectedOption == .hotelandhouseName{
                Text("choose a hotel or house name")
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    
                    TextField("Search Hotel or House",text: $destination)
                                         .font(.subheadline)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color(.systemGray4))
            }
            
            }else {
                ExtractedView(title: "Hotel or House Name", description: "Choise")
            }
        }.padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                selectedOption = .hotelandhouseName
            }
       
        VStack(alignment:.leading){
            if selectedOption == .type{
                Text("take a choose of type")
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack {
                    
                    
                    Picker("Category", selection: $selectedCategory) {
                                       ForEach(categories, id: \.self) { category in
                                           Text(category)
                                       }
                                   }
                                   .pickerStyle(MenuPickerStyle())
                                   .frame(width : 300)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color(.systemGray4))
            }
            
            }else {
                ExtractedView(title: "Hotel Or House", description: "Select Type")            }
        }.padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                selectedOption = .type
            }
        
            

    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct ExtractedView: View{
    let title: String
    let description: String
    
    var body: some View{
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        
    }
    
}
