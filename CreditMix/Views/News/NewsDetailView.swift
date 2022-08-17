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
    
    @State var showDetailView = false
    @State var size = CGSize()
    @State var url: URL?
//    let url = URL(string: "https://buolnd.com/Fv0k")
//    let url = Bundle.main.url(forResource: "News Example/index", withExtension: "html")
    
    
    var body: some View {
        ZStack {
                NewsWebView(url: url)
                    .ignoresSafeArea()
//                VStack {
//                    ForEach(1..<3) { _ in
//                        Button {
//                            showDetailView.toggle()
//                        } label: {
//                            NewsView()
//                        }
//                        .fullScreenCover(isPresented: $showDetailView) {
//                            NewsDetailView()
//                        }
//                        .buttonStyle(MenuButtonsStyle())
//                    }
//                }
            
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
