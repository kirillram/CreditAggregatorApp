//
//  NewsDetailWebView.swift
//  CreditMix
//
//  Created by Кирилл on 12.08.2022.
//

import Foundation
import SwiftUI
import WebKit

struct NewsDetailWebView: UIViewRepresentable {
    
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        guard let safeUrl = url else { print("URL is not safe"); return }
            let request = URLRequest(url: safeUrl)
            uiView.load(request)
    }
}

struct DetailView1_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = Bundle.main.url(forResource: "News Example/index", withExtension: "html")
        
        NewsDetailWebView(url: url)
        
    }
}

