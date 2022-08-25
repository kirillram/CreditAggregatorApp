//
//  NewsViewModel.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import Foundation
import SwiftUI
import CloudKit
import UIKit

final class NewsViewModel: ObservableObject {
    
    @Published var showDetailView = false
    @Published var title = ""
    @Published var date = Date()
    @Published var newsArray = [News]()
    @Published var currentDetailUrl: URL?
    
    func loadNewsFromCloud() {
        
        newsArray = []
        
        let pdb = CKContainer.init(identifier: "iCloud.com.KirillRam.CreditMix.main").database(with: .public)
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "news", predicate: predicate)
        
        
        pdb.fetch(withQuery: query) { result in
            
            switch result {
            case .success(let result):
                result.matchResults.compactMap { $0.1 }.forEach {
                    
                    switch $0 {
                    case .success(let record):
                        
//                        if record.value(forKey: "region") as? String == Locale.current.regionCode ?? "MX" || Locale.current.regionCode == "RU" {
                            
                            DispatchQueue.main.async {
                                
                                //MARK: - Title
                                
                                guard let title = record["title"] as? String else { print("Didn't get title"); return }
                                
                                //MARK: - Date
                                
                                guard let date = (record.creationDate)?.formatted(date: .long, time: .shortened) else { print("Didn't get date"); return }
                                
                                //MARK: - Image
                                guard let asset = record["image"] as? CKAsset else { return }
                                guard let assetURL = asset.fileURL else { print("Couldn't get URL for image"); return }
                                guard let imageData = try? Data(contentsOf: assetURL) else { print("Couldn't get data for image"); return }
                                guard let image = UIImage(data: imageData) else { print("no data"); return }
                                
                                //MARK: - Order
                                
                                guard let order = record["order"] as? Int else { print("Didn't get order number"); return }
                                
                                //MARK: - URL
                                let urlString = "https://kirillram.github.io/creditmix/MX/\(order)/"
                                guard let url = URL(string: urlString) else {print("Bad URL"); return }
                                
                                let news = News(title: title, date: date, image: Image(uiImage: image), order: order, url: url)
                                
                                self.newsArray.append(news)
                            }
//                        }
                        
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

