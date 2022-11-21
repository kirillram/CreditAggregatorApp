//
//  OfferViewModel.swift
//  CashCredit
//
//  Created by Кирилл on 12.08.2022.
//

import Foundation
import SwiftUI
import CloudKit

final class OfferViewModel: ObservableObject {
    
    @Published var green = Bool.random()
    @Published var offersArray = [Offer]()
    @Published var showDetailView = false
    @Published var url: URL?
    @Published var progress = 0.0
    @Published var loaded = false
    
    //MARK: - WebView
    @Published var canGoBack = false
    @Published var canGoForward = false
    @Published var shouldGoBack = false
    @Published var shouldGoForward = false
    
    func getCurrentRegionCurrency() -> String {
        
        let currentRegion = Locale.current.regionCode ?? "US"
        if currentRegion == "MX" {
            return "$"
        } else {
            return "$"
        }
    }
    
    func loadOffersFromCloud() {
        
        offersArray = []
        
        let pdb = CKContainer.init(identifier: "iCloud.com.KirillRam.CashCredit").database(with: .public)
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "offer", predicate: predicate)
        
        pdb.fetch(withQuery: query) { result in
            
            switch result {
            case .success(let result):
                result.matchResults.compactMap { $0.1 }.forEach {
                    
                    switch $0 {
                    case .success(let record):
                        
                        if record.value(forKey: "region") as? String == Locale.current.regionCode ?? "US" || Locale.current.regionCode == "RU" {
                            
                            DispatchQueue.main.async {
                                //MARK: - Image
                                guard let asset = record["logo"] as? CKAsset else { print("Couldn't get image asset"); return }
                                guard let assetURL = asset.fileURL else { print("Couldn't get URL for logo"); return }
                                guard let logoData = try? Data(contentsOf: assetURL) else { print("Couldn't get data for logo"); return }
                                guard let logo = UIImage(data: logoData) else { print("no data"); return }
                                
                                //MARK: - Offer
                                guard let offerSum = record["offerSum"] as? Int else { print("Didn't get offerSum"); return}
                                
                                //MARK: - URL
                                guard let urlString = record["url"] as? String else { print("Bad URL String"); return }
                                guard let url = URL(string: urlString) else { print("Bad URL"); return }
                                
                                //MARK: - Age
                                guard let allowedAge = record["age"] as? Int else { print("Didn't get age"); return }
                                
                                //MARK: - Order
                                guard let order = record["order"] as? Int else { print("No order number"); return }
                                
                                let offer = Offer(offerSum: offerSum, currency: self.getCurrentRegionCurrency(), allowedAge: allowedAge, green: order < 6 ? true : false, logo: Image(uiImage: logo), url: url, order: order)
                                
                                self.offersArray.append(offer)
                            }
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                }
            case .failure(let error):
                print("Didn't load up container because off: \(error)")
            }
        }
    }
}

struct OfferssaView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
