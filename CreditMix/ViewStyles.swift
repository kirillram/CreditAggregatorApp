//
//  ViewStyles.swift
//  CreditMix
//
//  Created by Кирилл on 12.08.2022.
//

import Foundation
import SwiftUI

struct MenuButtonsStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}
