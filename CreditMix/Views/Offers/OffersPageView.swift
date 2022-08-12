//
//  OffersView.swift
//  CreditMix
//
//  Created by Кирилл on 08.08.2022.
//

import SwiftUI

struct OffersPageView: View {
    
    var body: some View {
        
        VStack {
        ForEach(1..<7) { _ in
            Button {
                
            } label: {
                OfferView()
            }
            .buttonStyle(MenuButtonsStyle())
        }
        }
        .padding(.top, 84)
        .padding(.bottom, 94)
    }
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
