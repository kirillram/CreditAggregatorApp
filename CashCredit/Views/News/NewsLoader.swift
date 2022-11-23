//
//  NewsLoader.swift
//  CashCredit
//
//  Created by Кирилл on 21.11.2022.
//

import SwiftUI

struct NewsLoader: View {
    
    @State var startPoint = UnitPoint(x: -1, y: -1)
    @State var endPoint = UnitPoint(x: 0, y: 0)
    
    var body: some View {
        LinearGradient(colors: [
            Color(red: 0.89, green: 0.90, blue: 0.91),
            Color(red: 0.96, green: 0.97, blue: 0.97),
            Color(red: 0.89, green: 0.90, blue: 0.91)
        ], startPoint: startPoint, endPoint: endPoint)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: false))
         {
            startPoint = UnitPoint(x: 1, y: 1)
            endPoint = UnitPoint(x: 2, y: 2)
         }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .frame(height: 314)
        .padding(.bottom, 20)
        .padding(.horizontal, 16)
        .shadow(color: .white.opacity(0.04), radius: 8, x: 0, y: 2)
         
    }
}

struct sadssdd_Previews: PreviewProvider {
    static var previews: some View {
        OfferLoader()
    }
}
