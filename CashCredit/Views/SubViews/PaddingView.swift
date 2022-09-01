//
//  PaddingView.swift
//  CashCredit
//
//  Created by Кирилл on 26.08.2022.
//

import SwiftUI

struct PaddingView: View {
    
    var withProgressView: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            if withProgressView {
                Spacer()
                ProgressView()
                    .frame(alignment: .center)
                    .tint(.black)
                Spacer()
            }
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
        .listRowSeparatorTint(Color.clear, edges: .all)
    }
}
