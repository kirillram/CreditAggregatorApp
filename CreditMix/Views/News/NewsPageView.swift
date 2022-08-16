//
//  NewsPageView.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI
import CloudKit

struct NewsPageView: View {
    
    @State var showDetailView = false
    
    @StateObject var nvm = NewsViewModel()
    
    let url = Bundle.main.url(forResource: "News Example/index", withExtension: "html")
    
    var body: some View {
        
        VStack {
            ForEach(nvm.newsArray, id: \.recordId) { news in
                Button {
                    showDetailView.toggle()
                } label: {
                    NewsView(title: news.title, date: news.date, image: news.image)
                }
                .fullScreenCover(isPresented: $showDetailView) {
                    NewsDetailView(url: news.webPage)
                }
                .buttonStyle(MenuButtonsStyle())
            }
        }
        .onAppear {
            nvm.loadNews()
        }
        .padding(.top, 84)
        .padding(.bottom, 94)
    }
}

struct NewsPageView_Previews: PreviewProvider {
    static var previews: some View {
        let url = Bundle.main.url(forResource: "News Example/index", withExtension: "html")
//        NewsWebView(url: url)
        MainView()
            .environment(\.locale, .init(identifier: "es"))
    }
}
