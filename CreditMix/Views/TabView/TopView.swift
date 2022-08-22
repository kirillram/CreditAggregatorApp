//
//  TopTabView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import Foundation
import SwiftUI

struct TopView: View {
    
    @Binding var selectedIndexTitle: Int
    
    let tabbarItems =  [
        TabItem(image: "faq", selectedImage: "faq.filled", title: "FAQ"),
        TabItem(image: "offers", selectedImage: "offers.filled", title: "Offers"),
        TabItem(image: "news", selectedImage: "news.filled", title: "News")]
    
    var body: some View {
        
        VStack(spacing:0) {
            HStack {
                Text(tabbarItems[selectedIndexTitle].title)
                    .font(.custom("Manrope-Bold", size: 28))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 20)
            }
            .frame(width: screenW, height: 64)
            .background(
                Color("dark green")
                    .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea()
                    .shadow(color: .white.opacity(0.1), radius: 20, x: 0, y: 4)
            )
            Spacer()
        }
    }
}

struct   adssa_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
    }
}
