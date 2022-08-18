//
//  DetailView.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI
import UIKit

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var url: URL?
    
    var body: some View {
        ZStack {
            WebView(url: url)
//                VStack {
//                    ForEach(1..<3) { _ in
//                        Button {
//                            showDetailView.toggle()
//                        } label: {
//                            NewsView()
//                        }
//                        .fullScreenCover(isPresented: $showDetailView) {
//                            DetailView()
//                        }
//                        .buttonStyle(MenuButtonsStyle())
//                    }
//                }
            
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
