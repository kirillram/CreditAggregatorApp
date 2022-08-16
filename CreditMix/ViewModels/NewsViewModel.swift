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
    
    @Published var title = ""
    @Published var date = Date()
    @Published var newsArray = [News]()
    
    func loadNews() {
        
        let pdb = CKContainer.init(identifier: "iCloud.com.KirillRam.CreditMix.Mexica").database(with: .public)
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "news", predicate: predicate)
        
        
        pdb.fetch(withQuery: query) { result in
            switch result {
            case .success(let result):
                result.matchResults.compactMap { $0.1 }.forEach {
                    switch $0 {
                    case .success(let record):
                        
                        DispatchQueue.main.async {
                            
                            //MARK: - Image
                            guard let asset = record.object(forKey: "image") as? CKAsset else { return }
                            guard let assetURL = asset.fileURL else { print("Couldn't get URL for image"); return }
                            guard let data = try? Data(contentsOf: assetURL) else { print("Couldn't get data for image"); return }
                            guard let image = UIImage(data: data) else { print("no data"); return }
                            
                            
                            //MARK: - WebView
                            
                            guard let webView = record.object(forKey: "webPage") as? CKAsset else {print("Didn't load webView"); return }
                            guard let webViewUrl = webView.fileURL else { print("Couldn't get URL for webView"); return }
                            guard let webViewData = try? Data(contentsOf: webViewUrl) else { print("Couldn't get data for webView"); return }
                            
                            
                            
                            
                            let news = News(recordId: record.recordID, title: record.value(forKey: "title") as! String, date: (record.value(forKey: "date") as? Date)?.formatted(date: .long, time: .shortened).description ?? "" , webPage: webViewUrl, image: Image(uiImage: image))
                            
                            
                            self.newsArray.append(news)
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
