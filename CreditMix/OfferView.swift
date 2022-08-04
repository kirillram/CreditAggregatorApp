//
//  OfferView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import SwiftUI


struct OfferView: View {
    
    @State var sum = "50000 MXN"
    
    var body: some View {
        
        HStack {
            GeometryReader { geo in
                VStack(spacing:0) {
                    //MARK: - Up
                    ZStack {
                        Color.white
                        HStack{
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                            Spacer()
                            Button {
                                
                            } label: {
                                Image("linkArrow")
                            }

                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                    
                    //MARK: - Down
                    ZStack {
                        Color("orange")
                        HStack {
                            VStack (alignment: .leading, spacing: 0) {
                                Text("Возраст")
                                    .frame(height: 24)
                                    .font(.custom("GolosText-Regular", size: 16))
                                Text("от 18")
                                    .frame(height: 24)
                                    .font(.custom("GolosText-Regular", size: 20))
                            }
                            .foregroundColor(.white)
                            Spacer(minLength: 24)
                            VStack (alignment: .leading) {
                                Text("Сумма до")
                                    .frame(height: 24)
                                    .font(.custom("GolosText-Regular", size: 16))
                                Text(sum)
                                    .frame(height: 24)
                                    .font(.custom("GolosText-Regular", size: 32))
                            }
                            .frame(width: geo.size.width/2)
                            .foregroundColor(.white)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.55)
                }
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hexString: "#ED8145"), lineWidth: 1))
        .cornerRadius(12)
        .frame(height: 164)
        .padding()
        
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}
