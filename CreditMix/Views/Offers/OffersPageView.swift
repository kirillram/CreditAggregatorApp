//
//  OffersView.swift
//  CreditMix
//
//  Created by Кирилл on 08.08.2022.
//

import SwiftUI
import CloudKit

struct OffersPageView: View {
    
    @StateObject var ovm: OfferViewModel
    
    var body: some View {
        
        VStack {
            ForEach(ovm.offersArray.sorted { $0.order < $1.order }, id: \.order) { offer in
                    Button {
                        ovm.currentDetailUrl = offer.url
                        ovm.showDetailView.toggle()
                    } label: {
                        OfferView(orange: offer.orange, offerSum: offer.offerSum, currency: offer.currency, allowedAge: offer.allowedAge, logo: offer.logo)
                    }
                    .fullScreenCover(isPresented: $ovm.showDetailView) {
                            OfferDetailView(url: ovm.currentDetailUrl)
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
