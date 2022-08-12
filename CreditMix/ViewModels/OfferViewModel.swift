//
//  OfferViewModel.swift
//  CreditMix
//
//  Created by Кирилл on 12.08.2022.
//

import Foundation

final class OfferViewModel: ObservableObject {
    
    @Published var offerSum = "50000 MXN"
    @Published var allowedAge = 18
    @Published var orange = Bool.random()
    
}
