//
//  Offers.swift
//  CreditMix
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI

struct OffersPageView: View {
    
    @State var selectedTab: Int = 1
    
    var body: some View {
        
        ZStack {
            ScrollView {
                Color.red
                    .frame(width: screenW, height: screenH)
            }
            TabView(selectedIndex: $selectedTab)
            
        }
    }
}


struct Offers_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OffersPageView()
//            .previewDevice("iPhone 6s")
            .previewDevice("iPhone 6s Plus")
//            .previewDevice("iPhone 7")
//            .previewDevice("iPhone 7 Plus")
//            .previewDevice("iPhone 8")
//            .previewDevice("iPhone 8 Plus")
//            .previewDevice("iPhone 11 Pro")
//            .previewDevice("iPhone 11 Pro Max")
//            .previewDevice("iPhone 12")
//            .previewDevice("iPhone 12 Pro")
//            .previewDevice("iPhone 12 Pro Max")
//            .previewDevice("iPhone 12 mini")
//            .previewDevice("iPhone 13 mini")
//            .previewDevice("iPhone 13 Pro")
//            .previewDevice("iPhone 13 Pro Max")
    }
}
