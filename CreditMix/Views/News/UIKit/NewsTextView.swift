//
//  NewsText.swift
//  CreditMix
//
//  Created by Кирилл on 10.08.2022.
//

import Foundation
import SwiftUI

struct NewsText: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()

        let url = Bundle.main.url(forResource: "text", withExtension: "rtfd")!
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtfd]
        let rtfString = try! NSAttributedString(url: url, options: options, documentAttributes: nil)

        
        textView.attributedText = rtfString
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
    
    typealias UIViewType = UITextView
    
    
}

struct NewsDetailsdaView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
