//
//  NewsDetailView.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI
import UIKit

struct NewsDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var nvModel = NewsViewModel()
    
    let url = Bundle.main.url(forResource: "News Example/index", withExtension: "html")
    
    var body: some View {
        ZStack {
            NewsWebView(url: url)
            .ignoresSafeArea()
            
            
            GeometryReader { geo in
                Button {
                    presentationMode.wrappedValue.dismiss()
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
struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
