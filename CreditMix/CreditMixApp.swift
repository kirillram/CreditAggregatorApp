//
//  CreditMixApp.swift
//  CreditMix
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI

@main
struct CreditMixApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .onAppear {
                    
                    UIFont.familyNames.forEach({ familyName in
                        let fontNames = UIFont.fontNames(forFamilyName: familyName)
                        print(familyName, fontNames)
                    })
                }
        }
    }
}

struct CreditMax_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
