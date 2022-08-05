//
//  TopTabView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import Foundation
import SwiftUI

struct TopView: View {
    
    @Binding var selectedIndex: Int
    
    let tabbarItems =  [
        TabItem(image: "faq", selectedImage: "faq.filled", title: "FAQ"),
        TabItem(image: "offers", selectedImage: "offers.filled", title: "Предложения"),
        TabItem(image: "news", selectedImage: "news.filled", title: "Новости")]
    
    var body: some View {
        
            HStack {
            Text(tabbarItems[selectedIndex].title)
                .font(.custom("Manrope-Bold", size: 28))
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 20)
        }
        .frame(width: screenW)
        .background(
            Color("dark green")
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea()
                .shadow(color: .white.opacity(0.1), radius: 20, x: 0, y: 4)
        )
        
    }
}
