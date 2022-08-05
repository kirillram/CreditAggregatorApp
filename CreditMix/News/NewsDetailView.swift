//
//  NewsDetailView.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI

struct NewsDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var nvModel = NewsViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                Image(nvModel.news[0].image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 210)
                    .clipped()
                VStack(alignment: .leading, spacing: 0) {
                    Text(nvModel.news[0].date)
                        .font(.custom("Inter-Regular", size: 16))
                        .padding(.bottom, 8)
                    Text(nvModel.news[0].title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("Manrope-ExtraBold", size: 28))
                        .padding(.bottom, 20)
                    Text(nvModel.news[0].text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("Inter-Regular", size: 18))
                }
                .padding(.horizontal, 20)
            }
            .ignoresSafeArea(.all, edges: .top)
            
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
        .preferredColorScheme(.dark)
    }
}
struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
