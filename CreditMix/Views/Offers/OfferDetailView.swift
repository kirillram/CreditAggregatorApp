//
//  OfferDetailView.swift
//  CreditMix
//
//  Created by Кирилл on 19.08.2022.
//

import SwiftUI
import UIKit

struct OfferDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var url: URL?
    @StateObject var progressVM = OfferWebView.ProgressViewModel(progress: 0.0)
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("green")
                    .ignoresSafeArea(.all, edges: .top)
                OfferWebView(url: url, progressVM: progressVM)
                    .ignoresSafeArea(.all, edges: .bottom)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                VStack {
                    if progressVM.progress < 1.0 {
                        ProgressView(value: progressVM.progress)
                            .progressViewStyle(.linear)
                            .tint(Color("slightly darker gray"))
                        Spacer()
                    }
                }
            }
        }
    }
}
