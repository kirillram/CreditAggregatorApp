//
//  CreditMixApp.swift
//  CreditMix
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI
import CloudKit

@main
struct CreditMixApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .onAppear {
                    print(Locale.current.regionCode ?? "US")
                }
        }
    }
}

struct CreditMax_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
