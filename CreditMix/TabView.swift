//
//  TabView.swift
//  CreditMix
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI

struct TabItem: Hashable {
    let image: String
    let selectedImage: String
    let title: String
}

struct TabItemView: View {
    
    let item: TabItem
    let isSelected: Bool
    
    var body: some View {
        
        VStack(spacing: 5) {
            if item.image == "offers" && item.selectedImage == "offers.filled" {
                    Image(isSelected ? item.selectedImage : item.image)
                        .resizable()
                        .frame(width: 48, height: 48)
                        .offset(y: -10)
            } else {
                    VStack {
                        Image(isSelected ? item.selectedImage : item.image)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .frame(width: 48, height: 48)
            }
            
            
            Text(item.title)
                .foregroundColor(isSelected ? .black : .gray)
                .font(.system(size: 13))
        }
    }
}

struct TabView: View {
    
    let tabbarItems =  [
        TabItem(image: "faq", selectedImage: "faq.filled", title: "FAQ"),
        TabItem(image: "offers", selectedImage: "offers.filled", title: "Предложения"),
        TabItem(image: "news", selectedImage: "news.filled", title: "Новости")]
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        VStack {
            HStack(alignment: .bottom) {
                Text(tabbarItems[selectedIndex].title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title)
                }
            .frame(width: screenW, height: 150)
            .background(Color("dark green"))
            .cornerRadius(16)
            .shadow(radius: 5, x: -5, y: -4)
            
            Spacer()
            HStack{}
            .frame(width: screenW, height: 150)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 5, x: -5, y: -4)
            .overlay(
                HStack {
                    Spacer()
                    ForEach(tabbarItems.indices) { index in
                        Button {
                            self.selectedIndex = index
                        } label: {
                            let item = tabbarItems[index]
                            TabItemView(item: item, isSelected: selectedIndex == index)
                        }
                        Spacer()
                    }
                }
                    .offset(y: -screenW/10)
            )
            .offset(y: screenW/10)
        }
        .ignoresSafeArea()
    }
}

struct tab_Previews: PreviewProvider {
    static var previews: some View {
        
        Offers()
            .previewDevice("iPhone 13")
    }
}
