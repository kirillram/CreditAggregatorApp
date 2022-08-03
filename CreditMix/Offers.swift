//
//  Offers.swift
//  CreditMix
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI

struct Offers: View {
    
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
    
    @State var selectedTab: Int
    
    static var previews: some View {
        
        Offers()
            .previewDevice("iPhone 11")
            //            .previewDevice("iPhone 11 Pro")
            //            .previewDevice("iPhone 11 Pro Max")
            //            .previewDevice("iPhone 12")
            //            .previewDevice("iPhone 12 Pro")
            //            .previewDevice("iPhone 12 Pro Max")
            //            .previewDevice("iPhone 12 mini")
            //            .previewDevice("iPhone 13 mini")
//                        .previewDevice("iPhone 13 Pro")
            //            .previewDevice("iPhone 13 Pro Max")
    }
}
