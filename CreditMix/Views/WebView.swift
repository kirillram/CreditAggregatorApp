//
//  NewsDetailWebView.swift
//  CreditMix
//
//  Created by Кирилл on 15.08.2022.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.scrollView.contentInsetAdjustmentBehavior = .never
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = url {
            let request = URLRequest(url: url)
            uiView.load(request)
            print(url)
        } else {
            print("URL is corrupted, it's nil")
        }
    }
}