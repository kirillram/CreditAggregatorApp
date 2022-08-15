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
            if item.image == "offers" && item.selectedImage == "offers.filled" {
                    Image(isSelected ? item.selectedImage : item.image)
                        .resizable()
                        .offset(y: -10)
                        .frame(width: 48, height: 48)
            } else {
                VStack {
                        Image(isSelected ? item.selectedImage : item.image)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                .frame(width: 48, height: 48)
            }
            
            
            Text(item.title)
                .foregroundColor(isSelected ? Color("dark green") : Color("black"))
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
