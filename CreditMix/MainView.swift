//
//  Offers.swift
//  CreditMix
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTab: Int = 2
    
    var body: some View {
        
        ZStack {
            Color("background")
            
            ScrollView(showsIndicators: true) {
                
                if selectedTab == 0 {
                    FaqPageView()
                } else if selectedTab == 1 {
                    OffersPageView()
                } else if selectedTab == 2 {
                    NewsPageView()
                }
            }
            .zIndex(0)
            .ignoresSafeArea(.all, edges: .bottom)
            TopView(selectedIndex: $selectedTab)
                .zIndex(1)
            BottomView(selectedIndex: $selectedTab)
                .ignoresSafeArea(.all, edges: .bottom)
                .zIndex(1)
        }
    }
}


struct Main_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
//            .previewLayout(.sizeThatFits)
//            .previewDevice("iPhone Xs")
        //            .previewDevice("iPhone 6s")
        //            .previewDevice("iPhone 6s Plus")
        //            .previewDevice("iPhone 7")
        //            .previewDevice("iPhone 7 Plus")
        //            .previewDevice("iPhone 8")
        //            .previewDevice("iPhone 8 Plus")
                    .previewDevice("iPhone 11")
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