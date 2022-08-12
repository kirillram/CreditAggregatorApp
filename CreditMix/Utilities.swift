//
//  Utilities.swift
//  CreditMix
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

extension NSAttributedString {
    func changeFontSize(factor: CGFloat) -> NSAttributedString {
        guard let output = self.mutableCopy() as? NSMutableAttributedString else {
            return self
        }

        output.beginEditing()
        output.enumerateAttribute(NSAttributedString.Key.font,
                                  in: NSRange(location: 0, length: self.length),
                                  options: []) { (value, range, stop) -> Void in
            guard let oldFont = value as? UIFont else {
                return
            }
            let newFont = oldFont.withSize(oldFont.pointSize * factor)
            output.removeAttribute(NSAttributedString.Key.font, range: range)
            output.addAttribute(NSAttributedString.Key.font, value: newFont, range: range)
        }
        output.endEditing()

        return output
    }
}
