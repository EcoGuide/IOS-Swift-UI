//
//  RecentlyBookedGuide.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 6/11/2023.
//

import SwiftUI



struct RecentlyBookedGuide: View {
    @State private var isGridView = false
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2) // 2 columns
    @StateObject var guideViewModel : GuideViewModel

  

    var body: some View {
        ScrollView {
            Spacer()
            HStack {
                Image(systemName: "arrow.left")
                    .font(.system(size: 22, weight: .semibold))
                Text("Recently Booked")
                    .font(Font.custom("Urbanist-bold", size: 22).bold())
                Spacer()
                HStack {
                    Image(systemName: "doc.fill") // list view item
                        .font(.system(size: 24))
                        .foregroundColor(Color.blue)
                    Button(action: {
                        isGridView.toggle()
                    }) {
                        Image(systemName: isGridView ? "list.dash" : "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.trailing, 20)
            .onAppear {
                            guideViewModel.fetchGuides()
                        }
            if isGridView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(guideViewModel.guides ,id: \._id) { guide in
                        GridItemView(guide: guide)
                    }
                }
                .padding(.trailing, 20)
            } else {
                ForEach(guideViewModel.guides ,id: \._id) { guide in
                    ListItemView(guide: guide)
                }
                .padding(.trailing, 20)
            }
        }
        .padding()
    }
}

struct GridItemView: View {
    var guide : Guide
    var body: some View {
        ZStack {
            Color(hex: "F3F8FE")
                
                .frame(height: 250)
                .cornerRadius(20)
            VStack(spacing: 5) {
                Image(guide.image)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
                Text(guide.fullname)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)

              
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(guide.reviews)
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                    Text(guide.location)
                        .font(.system(size: 13))
                        .fontWeight(.regular)
        
                        .foregroundColor(Color.gray)
        
                }
               
                
                HStack(spacing: 15) {
                    Text(String(format: "%.2f", guide.price))
                        .font(.system(size: 18))
                        .fontWeight(.regular)
        
                        .foregroundColor(Color.blue)
                    Text("/ day").font(.system(size: 13))
                        .fontWeight(.semibold).foregroundColor(Color.blue)
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                        .foregroundColor(Color.blue)
                }
            }
            .frame(width:160)
           
          
        } .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(hex: "F3F8FE"))
                .shadow(color: Color.black.opacity(0.4), radius: 3, x: 0, y: 4)
        )
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        )
        
    }
}

struct ListItemView: View {
    var guide : Guide

    var body: some View {
           ZStack {
               Color(hex: "F3F8FE")
                   .frame(height: 150).frame(width: 350)
                   .cornerRadius(20)
               HStack(spacing: 5) {
                   Image(guide.image)
                       .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 15) {
                    Text(guide.fullname)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text(guide.location)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(guide.reviews)
                            .font(.system(size: 15))
                    }
                }
                .frame(maxWidth: .infinity)
                Spacer()
                VStack(alignment: .trailing, spacing: 15) {
                    Text(String(format: "%.2f", guide.price))
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.blue)
                    Text("/ day").foregroundColor(Color.blue) .fontWeight(.semibold)
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                        .foregroundColor(Color.black)
                }
            }
               .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
               
        }
        .padding(.trailing, 4)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(hex: "F3F8FE"))
                .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 2)
        )
    }
}
struct RecentlyBookedGuide_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyBookedGuide(guideViewModel: GuideViewModel())
    }
}
