//
//  NewsPageView.swift
//  CashCredit
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI
import CloudKit

struct NewsPageView: View {
    
    @StateObject var nvm = NewsViewModel()
    
    var body: some View {
        
        List {
            
            //MARK: - //MARK: - Padding top
            PaddingView(withProgressView: true)
                .frame(height: 84)
            
            //MARK: - News
            
            if nvm.newsArray.count < 2 {
                ForEach((1...5), id:\.self)  {_ in
                    NewsLoader()
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(Color.clear, edges: .all)
            } else {
                ForEach(nvm.newsArray.sorted { $0.order < $1.order }.reversed(), id: \.order) { news in
                    Button {
                        nvm.currentDetailUrl = news.url
                        nvm.showDetailView.toggle()
                    } label: {
                        NewsView(title: news.title, date: news.date, image: news.image)
                    }
                    .buttonStyle(MenuButtonsStyle())
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(Color.clear, edges: .all)
            }
            
            //MARK: - Padding bottom
            PaddingView(withProgressView: false)
                .frame(height: 94)
        }
        .fullScreenCover(isPresented: $nvm.showDetailView)  {
            NewsDetailView(url: nvm.currentDetailUrl)
        }
        .refreshable {
            nvm.loadNewsFromCloud()
        }
        .listStyle(.plain)
    }
}

struct NewsPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.locale, .init(identifier: "MX"))
    }
}
