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
        
        List {
            //MARK: - //MARK: - Padding top
            PaddingView(withProgressView: true)
                .frame(height: 84)
            
            //MARK: - Offers
                ForEach(ovm.offersArray.sorted { $0.order < $1.order }, id: \.order) { offer in
                    Button {
                        ovm.url = offer.url
                        ovm.showDetailView.toggle()
                    } label: {
                        OfferView(green: offer.green, offerSum: offer.offerSum, currency: offer.currency, allowedAge: offer.allowedAge, logo: offer.logo)
                    }
                    .buttonStyle(MenuButtonsStyle())
                    .padding(0)
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(Color.clear, edges: .all)
            
            //MARK: - Padding bottom
            PaddingView(withProgressView: false)
                .frame(height: 94)
        }
        .fullScreenCover(isPresented: $ovm.showDetailView) {
            OfferDetailView(ovm: ovm)
        }
        .refreshable {
            ovm.loadOffersFromCloud()
        }
        .listStyle(.plain)
    }
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
