//
//  TabItemView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import Foundation
import SwiftUI

struct TabItemView: View {
    
    let item: TabItem
    let isSelected: Bool
    
    var body: some View {
        
        VStack(spacing: 4) {
            if item.title == "Offers" {
                Image(isSelected ? item.selectedImage : item.image)
                    .resizable()
                    .offset(y: -10)
                    .frame(width: 48, height: 48)
            } else {
                VStack {
                    Image(isSelected ? item.selectedImage : item.image)
                        .resizable()
                        .foregroundColor(isSelected ? Color(red: 0.32312, green: 0.31234, blue: 1) : Color("black"))
                        .frame(width: 20, height: 20)
                }
                .frame(width: 48, height: 48)
            }
            
            
            Text(item.title)
                .foregroundColor(isSelected ? Color(red: 0.32312, green: 0.31234, blue: 1) : Color("black"))
                .font(.custom("Inter-Medium", size: 13))
        }
    }
}

struct adsasd_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.locale, .init(identifier: "es"))
    }
}
