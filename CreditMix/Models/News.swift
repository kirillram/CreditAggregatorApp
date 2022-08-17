//
//  News.swift
//  CreditMix
//
//  Created by Кирилл on 12.08.2022.
//

import Foundation
import CloudKit
import SwiftUI

struct News {
    
    let recordId: CKRecord.ID?
    let title: String
    let date: String
    let url: URL?
    let image: Image
}
