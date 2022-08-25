//
//  NewsDetailView.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI

struct NewsDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var url: URL?
    
    var body: some View {
        ZStack {
            NewsWebView(url: url)
                .ignoresSafeArea()
            
            GeometryReader { geo in
                Button {
                    dismiss()
                } label: {
                    Image("back button")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
            }
            .padding(20)
        }
        .preferredColorScheme(.light)
    }
}
