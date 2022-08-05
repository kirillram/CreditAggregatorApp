//
//  OfferView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import SwiftUI

struct Offer {
    
    let offerSum: String
    let allowedAge: Int
    let orange: Bool
}

struct OfferView: View {
    
    @State var offerSum = "50000 MXN"
    @State var allowedAge = 18
    @State var orange = false
    
    var body: some View {
        
        GeometryReader { geo in
            VStack(spacing:0) {
                //MARK: - Top
                ZStack {
                    Color.white
                    HStack{
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                        Image("linkArrow")
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
                
                //MARK: - Middle
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(orange ? Color("orange border") : Color("border"))

                //MARK: - Bottom
                ZStack {
                    orange ?  Color("orange") : Color("light gray")
                    HStack(spacing: 24) {
                        //MARK: - Left
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Возраст")
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 16))
                                .opacity(orange ? 1 : 0.8)
                            Text("от \(allowedAge)")
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 20))
                        }
                        .frame(maxWidth: geo.size.width/2, alignment: .leading)
                        .foregroundColor(orange ? .white : Color("black"))
                        
                        //MARK: - Right
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Сумма до")
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 16))
                                .opacity(orange ? 1 : 0.8)
                            Text(offerSum)
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 20))
                        }
                        .frame(maxWidth: geo.size.width/2, alignment: .leading)
                        .foregroundColor(orange ? .white : Color("black"))
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.55)
//                .border(Color(hexString: "border").opacity(orange ? 0 : 0.08))
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(orange ? Color("orange border") : Color("border")))
        .cornerRadius(12)
        .frame(height: 164)
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .shadow(color: .white.opacity(0.04), radius: 8, x: 0, y: 2)
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}
