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
    
    @State var ovm : OfferViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottom) {
                Color("dark green")
                    .ignoresSafeArea()
                
                //MARK: - WebView
                
                OfferWebView(ovm: ovm)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .ignoresSafeArea(.all, edges: .bottom)
                    .safeAreaInset(edge: .bottom) {
                        if ovm.canGoForward || ovm.canGoBack {
                            HStack {
                                Button {
                                    ovm.shouldGoBack.toggle()
                                } label: {
                                    if ovm.canGoBack {
                                        Image(systemName: "arrow.backward")
                                    }
                                }
                                .padding(.leading, 25)
                                
                                Spacer()
                                
                                Button {
                                    ovm.shouldGoForward.toggle()
                                } label: {
                                    if ovm.canGoForward {
                                        Image(systemName: "arrow.forward")
                                    }
                                }
                                .padding(.trailing, 25)
                            }
                            .padding(.vertical, 10)
                            .tint(.white)
                            .background(Color("dark green")
                                .ignoresSafeArea())
                        }

                    }
                
                //MARK: - Progress Bar
                
                VStack {
                    if ovm.progress < 1.0 {
                        ProgressView(value: ovm.progress)
                            .progressViewStyle(.linear)
                            .tint(Color("slightly darker gray"))
                        Spacer()
                    }
                }
                
            }
        }
    }
}
