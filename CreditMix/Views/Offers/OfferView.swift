//
//  OfferView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import SwiftUI

struct OfferView: View {
    
    @State var green: Bool
    @State var offerSum: Int
    @State var currency: String
    @State var allowedAge: Int
    @State var logo: Image
    
    var body: some View {
        
        GeometryReader { geo in
            VStack(spacing:0) {
                //MARK: - Top
                ZStack {
                    Color.white
                    HStack{
                        logo
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200, alignment: .leading)
                        Spacer()
                        Image("linkArrow")
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
                
                //MARK: - Middle
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(green ? Color("dark green") : Color("border"))
                
                //MARK: - Bottom
                ZStack {
                    green ?  Color("green") : Color("light gray")
                    HStack(spacing: 24) {
                        //MARK: - Left
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Age")
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 16))
                                .opacity(green ? 1 : 0.8)
                            
                            HStack {
                                Text(LocalizedStringKey("from "))
                                Text(allowedAge.description)
                            }
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 20))
                        }
                        .frame(maxWidth: geo.size.width/2, alignment: .leading)
                        .foregroundColor(green ? .white : Color("black"))
                        
                        //MARK: - Right
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Amount up to")
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 16))
                                .opacity(green ? 1 : 0.8)
                            HStack {
                                Text(offerSum.description)
                                Text(currency)
                            }
                            .frame(height: 24)
                            .font(.custom("GolosText-Regular", size: 20))
                        }
                        .frame(maxWidth: geo.size.width/2, alignment: .leading)
                        .foregroundColor(green ? .white : Color("black"))
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.55)
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(green ? Color("dark green") : Color("border")))
        .cornerRadius(12)
        .frame(height: 164)
        .padding(.bottom, 20)
        .padding(.horizontal, 16)
        .shadow(color: .white.opacity(0.04), radius: 8, x: 0, y: 2)
    }
}
