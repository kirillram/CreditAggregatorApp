//
//  Offers.swift
//  CreditMix
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTab: Int = 1
    
    @StateObject var nvm = NewsViewModel()
    @StateObject var ovm = OfferViewModel()
    
    var body: some View {
        
        ZStack {
            Color("background")
            
            VStack {
                if selectedTab == 0 {
                    FaqPageView()
                } else if selectedTab == 1 {
                    OffersPageView(ovm: ovm)
                } else if selectedTab == 2 {
                    NewsPageView(nvm: nvm)
                }
            }
            .zIndex(0)
            .ignoresSafeArea(.all, edges: .bottom)
            
            TopView(selectedIndexTitle: $selectedTab)
                .zIndex(1)
            
            BottomView(selectedIndex: $selectedTab)
                .ignoresSafeArea(.all, edges: .bottom)
                .zIndex(1)
        }
        .onAppear {
            nvm.loadNewsFromCloud()
            ovm.loadOffersFromCloud()
        }
    }
}


struct Main_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
            .environment(\.locale, .init(identifier: "es"))
            .previewDevice("iPhone Xs")
//            .previewDevice("iPhone 6s")
//            .previewDevice("iPhone 6s Plus")
//            .previewDevice("iPhone 7")
//            .previewDevice("iPhone 7 Plus")
//            .previewDevice("iPhone 8")
//            .previewDevice("iPhone 8 Plus")
//            .previewDevice("iPhone 11")
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
