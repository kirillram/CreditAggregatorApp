//
//  Utilities.swift
//  CashCredit
//
//  Created by Кирилл on 03.08.2022.
//

import Foundation
import UIKit
import SwiftUI

extension View {
    
    var screenW : CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var screenH : CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

