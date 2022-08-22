//
//  OfferWebView.swift
//  CreditMix
//
//  Created by Кирилл on 19.08.2022.
//

import Foundation
import SwiftUI
import WebKit

struct OfferWebView: UIViewRepresentable {
    
    private let webView = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
    
    @ObservedObject var ovm: OfferViewModel
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, ovm: ovm)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = self.ovm.url else {
            return webView
        }
        
        let request = URLRequest(url: url)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if ovm.shouldGoBack {
            uiView.goBack()
            ovm.shouldGoBack = false
        }
        if ovm.shouldGoForward {
            uiView.goForward()
            ovm.shouldGoForward = false
        }
    }
}

extension OfferWebView  {
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        @ObservedObject private var ovm: OfferViewModel
        
        private var parent: OfferWebView
        private var observer: NSKeyValueObservation?
        
        init(_ parent: OfferWebView, ovm: OfferViewModel) {
            self.parent = parent
            self.ovm = ovm
            
            super.init()
            
            observer = self.parent.webView.observe(\.estimatedProgress) { [weak self] webView, _ in
                guard let self = self else { return }
                self.parent.ovm.progress = webView.estimatedProgress
            }
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            ovm.canGoBack = webView.canGoBack
            ovm.canGoForward = webView.canGoForward
        }
    }
}
