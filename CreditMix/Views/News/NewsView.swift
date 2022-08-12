//
//  News.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI


struct NewsView: View {
    
    @State var title = "Правила досрочного погашения кредита"
    @State var date = "24 июл. 2022 г., 21:24"
    @State var image = "credit"
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 0) {
            
            Image(image)
                .resizable()
                .frame(height: 204)
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.custom("Manrope-ExtraBold", size: 18))
                    .foregroundColor(Color("black"))
                    .lineSpacing(0.2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                Text(date)
                    .font(.custom("Inter-Regular", size: 16))
                    .foregroundColor(Color("black").opacity(0.8))
                    .lineSpacing(0.2)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(20)
        }
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color("border")))
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color.white.opacity(0.08), radius: 8, x: 0, y: 2)
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

struct News_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
