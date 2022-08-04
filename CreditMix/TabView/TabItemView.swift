//
//  TabItemView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import Foundation
import SwiftUI
import DynamicColor

struct TabItem {
    let image: String
    let selectedImage: String
    let title: String
}

struct TabItemView: View {
    
    let item: TabItem
    let isSelected: Bool
    
    var body: some View {
        
        VStack(spacing: 4) {
            if item.image == "offers" && item.selectedImage == "offers.filled" {
                    Image(isSelected ? item.selectedImage : item.image)
                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48, height: 48)
                        .offset(y: -10)
            } else {
                    VStack {
                        Image(isSelected ? item.selectedImage : item.image)
                            .resizable()
//                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                    .frame(width: 48, height: 48)
            }
            
            
            Text(item.title)
                .foregroundColor(isSelected ? Color("dark green") : Color(hexString: "#373737"))
                .font(.custom("Inter-Medium", size: 13))
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        TabView(selectedIndex: .constant(0))
            .previewDevice("iPhone 11")
    }
}
