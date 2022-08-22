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
        
        List {
            
            //MARK: - //MARK: - Padding top
            HStack(alignment: .center) {
                Spacer()
                ProgressView()
                    .frame(alignment: .center)
                    .tint(.black)
                Spacer()
            }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(Color.clear, edges: .all)
                .frame(height: 84)
            
            //MARK: - News
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
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .listRowSeparatorTint(Color.clear, edges: .all)
            
            //MARK: - Padding bottom
            HStack {}
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(Color.clear, edges: .all)
                .frame(height: 94)
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
