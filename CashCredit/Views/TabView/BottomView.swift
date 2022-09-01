//
//  TabView.swift
//  CashCredit
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI

struct BottomView: View {
    
    let tabbarItems =  [
        TabItem(image: "faq", selectedImage: "faq.fill", title: "FAQ"),
        TabItem(image: "offers", selectedImage: "offers.fill" , title: "Offers"),
        TabItem(image: "news", selectedImage: "news.fill", title: "News")]
    
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                ForEach(tabbarItems.indices) { index in
                    Button {
                        self.selectedIndex = index
                    } label: {
                        TabItemView(item: tabbarItems[index], isSelected: selectedIndex == index)
                            .frame(width: 110, height: 94)
                    }
                    .buttonStyle(TabButtonStyle())
                    
                    Spacer()
                }
            }
            .offset(y: -10)
            .frame(height: 94)
            .background(
                Color.white
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .shadow(color: .white.opacity(0.1), radius: 16, x: 0, y: -4)
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
        //            .previewDevice("iPhone SE (1st generation)")
        //            .previewDevice("iPhone SE (3rd generation)")
        //            .previewDevice("iPhone X")
//            .previewDevice("iPhone Xs")
        //            .previewDevice("iPhone Xs Max")
        //            .previewDevice("iPhone Xr")
    }
}
