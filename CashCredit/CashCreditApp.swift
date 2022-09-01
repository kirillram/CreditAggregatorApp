//
//  CashCreditApp.swift
//  CashCredit
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI
import CloudKit

@main
struct CashCreditApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .onAppear {
                    print(Locale.current.regionCode ?? "Didn't get region code")
                }
        }
    }
}

struct CreditMax_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
