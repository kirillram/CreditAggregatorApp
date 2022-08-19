//
//  LoadingView.swift
//  CreditMix
//
//  Created by Кирилл on 19.08.2022.
//

import Foundation
import SwiftUI

struct LoadingView: View {
 
    @State private var isLoading = false
 
    var body: some View {
        ZStack {
 
            Text(LocalizedStringKey("Loading"))
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(x: 0, y: -25)
 
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .frame(width: 250, height: 3)
 
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.green, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110, y: 0)
            }
        }
        .onAppear() {
            self.isLoading = true
        }
    }
}
