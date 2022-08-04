//
//  TabView.swift
//  CreditMix
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI

struct BottomView: View {
    
    let tabbarItems =  [
        TabItem(image: "faq", selectedImage: "faq.filled", title: "FAQ"),
        TabItem(image: "offers", selectedImage: "offers.filled", title: "Предложения"),
        TabItem(image: "news", selectedImage: "news.filled", title: "Новости")]
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        VStack {
            HStack{}
                .frame(width: screenW, height: 94)
                .shadow(radius: 5, x: -5, y: -4)
                .background(
                    Color.white
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                        .ignoresSafeArea()
                        .shadow(radius: 5, x: 5, y: 4)
                )
                .overlay(
                    //                    GeometryReader { geo in
                    HStack {
                        Spacer()
                        ForEach(tabbarItems.indices) { index in
                            Button {
                                withAnimation {
                                    self.selectedIndex = index
                                }
                            } label: {
                                
                                let item = tabbarItems[index]
                                
                                TabItemView(item: item, isSelected: selectedIndex == index)
                            }
                            Spacer()
                        }
                    }
                        .frame(height: 60, alignment: .bottom)
                    
                        .offset(y: -10)
                    //                                    }
                )
        }
    }
}

struct tab_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView()
        //            .previewDevice("iPhone 6s")
        //            .previewDevice("iPhone 6s Plus")
        //            .previewDevice("iPhone 7")
        //            .previewDevice("iPhone 7 Plus")
        //            .previewDevice("iPhone 8")
        //            .previewDevice("iPhone 8 Plus")
            .previewDevice("iPhone 11 Pro")
        //            .previewDevice("iPhone 11 Pro Max")
        //            .previewDevice("iPhone 12")
        //            .previewDevice("iPhone 12 Pro")
        //            .previewDevice("iPhone 12 Pro Max")
        //            .previewDevice("iPhone 12 mini")
        //            .previewDevice("iPhone 13 mini")
        //            .previewDevice("iPhone 13 Pro")
        //            .previewDevice("iPhone 13 Pro Max")
        //            .previewDevice("iPhone SE (1st generation)")
        //            .previewDevice("iPhone SE (3rd generation)")
        //            .previewDevice("iPhone X")
        //            .previewDevice("iPhone Xs")
        //            .previewDevice("iPhone Xs Max")
        //            .previewDevice("iPhone Xr")
    }
}
