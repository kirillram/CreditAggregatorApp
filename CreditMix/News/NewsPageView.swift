//
//  NewsPageView.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI

struct NewsPageView: View {
    
    @State var showDetailView = false
    
    var body: some View {
        
        VStack {
        ForEach(1..<7) { _ in
            Button {
                showDetailView.toggle()
            } label: {
                NewsView()
            }
            .fullScreenCover(isPresented: $showDetailView) {
                NewsDetailView()
            }
            .buttonStyle(MenuButtonsStyle())
        }
        }
        .padding(.top, 84)
        .padding(.bottom, 94)
    }
}

struct NewsPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
