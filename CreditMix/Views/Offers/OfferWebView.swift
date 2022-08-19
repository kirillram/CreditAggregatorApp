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
    
    let url: URL?
    
    @ObservedObject var progressVM: ProgressViewModel
    
    private let webView = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, viewModel: progressVM)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.allowsBackForwardNavigationGestures = true
        if let url = url {
            let request = URLRequest(url: url)
            webView.load(request)
            print(url)
        } else {
            print("URL is corrupted, it's nil")
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

extension OfferWebView  {
    
    class ProgressViewModel: ObservableObject {
        
        @Published var progress: Double = 0.0
        
        init (progress: Double) {
            self.progress = progress
        }
    }
    
    class Coordinator: NSObject {
        
        private var parent: OfferWebView
        private var progressVM: ProgressViewModel
        private var observer: NSKeyValueObservation?
        
        init(_ parent: OfferWebView, viewModel: ProgressViewModel) {
            self.parent = parent
            self.progressVM = viewModel
            
            super.init()
            
            observer = self.parent.webView.observe(\.estimatedProgress) { [weak self] webView, _ in
                guard let self = self else { return }
                self.parent.progressVM.progress = webView.estimatedProgress
            }
        }
    }
}
