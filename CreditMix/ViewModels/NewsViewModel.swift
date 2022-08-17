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
        
        let pdb = CKContainer.init(identifier: "iCloud.com.KirillRam.CreditMix.main").database(with: .public)
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "news", predicate: predicate)
        
        
        pdb.fetch(withQuery: query) { result in
            
            switch result {
            case .success(let result):
                result.matchResults.compactMap { $0.1 }.forEach {
                    
                    switch $0 {
                    case .success(let record):
                        
                        if record.value(forKey: "region") as? String == Locale.current.regionCode ?? "US" {
                            
                            DispatchQueue.main.async {
                                //MARK: - Image
                                guard let asset = record["image"] as? CKAsset else { return }
                                guard let assetURL = asset.fileURL else { print("Couldn't get URL for image"); return }
                                guard let imageData = try? Data(contentsOf: assetURL) else { print("Couldn't get data for image"); return }
                                guard let image = UIImage(data: imageData) else { print("no data"); return }
                                
                                let news = News(recordId: record.recordID, title: record["title"] as! String, date: (record.creationDate)?.formatted(date: .long, time: .shortened).description ?? "" , url: URL(string: record["url"] as! String), image: Image(uiImage: image))
                                
                                self.newsArray.append(news)
                                print(news.url ?? "nothing")
                                
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
    
    func getURLsForWebPage(_ assets: [CKAsset]) -> [URL] {
        var urls = [URL]()
        
        for asset in assets {
            guard let assetURL = asset.fileURL else { fatalError("Couldn't get URL for Index\(asset)")}
            urls.append(assetURL)
        }
        return urls
    }
    
    func getDataForWebPage(_ assets: [CKAsset]) -> [Data] {
        var data = [Data]()
        
        for asset in assets {
            
            guard let assetURL = asset.fileURL else { fatalError("Couldn't get URL for Index\(asset)")}
            guard let assetData = try? Data(contentsOf: assetURL) else { fatalError("Couldn't get data for webPage")}
            data.append(assetData)
            
        }
        return data
    }
    
    private func copyBundleResourceToTemporaryDirectory(url: URL)
    {
       let tempDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
       
       do {
           try FileManager.default.removeItem(at: tempDirectoryURL)
           try FileManager.default.copyItem(at: url, to: tempDirectoryURL)
       } catch let error {
           print("Unable to copy file: \(error)")
       }
    }
}

