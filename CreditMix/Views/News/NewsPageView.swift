//
//  NewsPageView.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI
import CloudKit

struct NewsPageView: View {
    
    @StateObject var nvm = NewsViewModel()
    
    var body: some View {
        
        VStack {
            ForEach(nvm.newsArray.sorted { $0.order < $1.order }.reversed(), id: \.order) { news in
                Button {
                    nvm.currentDetailUrl = news.url
                    nvm.showDetailView.toggle()
                } label: {
                    NewsView(title: news.title, date: news.date, image: news.image)
                }
                .fullScreenCover(isPresented: $nvm.showDetailView)  {
                    NewsDetailView(url: nvm.currentDetailUrl)
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
            .environment(\.locale, .init(identifier: "MX"))
    }
}
