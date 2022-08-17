//
//  OfferView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import SwiftUI

struct OfferView: View {
    
    @StateObject var ofvModel = OfferViewModel()
    
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
                    .foregroundColor(ofvModel.orange ? Color("orange border") : Color("border"))
                
                //MARK: - Bottom
                ZStack {
                    ofvModel.orange ?  Color("orange") : Color("light gray")
                    HStack(spacing: 24) {
                        //MARK: - Left
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Age")
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 16))
                                .opacity(ofvModel.orange ? 1 : 0.8)
                            
                            HStack {
                                Text(LocalizedStringKey("from "))
                                Text(ofvModel.allowedAge)
                            }
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 20))
                        }
                        .frame(maxWidth: geo.size.width/2, alignment: .leading)
                        .foregroundColor(ofvModel.orange ? .white : Color("black"))
                        
                        //MARK: - Right
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Amount up to")
                                .frame(height: 24)
                                .font(.custom("GolosText-Regular", size: 16))
                                .opacity(ofvModel.orange ? 1 : 0.8)
                            HStack {
                                Text(ofvModel.offerSum)
                                Text(ofvModel.currency)
                            }
                            .frame(height: 24)
                            .font(.custom("GolosText-Regular", size: 20))
                        }
                        .frame(maxWidth: geo.size.width/2, alignment: .leading)
                        .foregroundColor(ofvModel.orange ? .white : Color("black"))
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.55)
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(ofvModel.orange ? Color("orange border") : Color("border")))
        .cornerRadius(12)
        .frame(height: 164)
        .padding(.bottom, 20)
        .padding(.horizontal, 16)
        .shadow(color: .white.opacity(0.04), radius: 8, x: 0, y: 2)
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
            .environment(\.locale, .init(identifier: "vi"))
    }
}

//enum Translation {
//
//    static func title(name: String) -> String {
//        return String.localizedStringWithFormat(NSLocalizedString("Welcome %@, this is my app", comment: ""), name)
//    }
//}
