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
            VStack(spacing:0) {
                TopView(selectedIndex: $selectedTab)
//                    .zIndex(1)
                ScrollView(showsIndicators: true) {
                    
                    if selectedTab == 0 {
                        FaqView()
                    } else if selectedTab == 1 {
                        
                        ForEach(1..<7) { _ in
                            Button {
                                
                            } label: {
                                OfferView(orange: Bool.random())
                            }
                        }
                    } else if selectedTab == 2 {
                        NewsPageView()
                    }
                }
//                .zIndex(0)
                BottomView(selectedIndex: $selectedTab)
//                    .zIndex(1)
            }
            .frame(width: screenW)
            .ignoresSafeArea(edges: .bottom)
        }
//        .background()
    }
}


struct Main_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
            .previewDevice("iPhone Xs")
        //            .previewDevice("iPhone 6s")
//            .previewDevice("iPhone 6s Plus")
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
