//
//  ContentView.swift
//  CreditMix
//
//  Created by Кирилл on 03.08.2022.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color("dark green")
                .ignoresSafeArea()
            Image("logo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
