//
//  FaqQuestionView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import SwiftUI

struct FaqQuestionView: View {
    
    @State var opened = false
    
    var body: some View {

        VStack(spacing:0) {
            //MARK: - Top
            ZStack {
                Button {
                    withAnimation {
                        opened.toggle()
                    }
                } label: {
                    HStack{
                        Text("Сколько я могу занять?")
                            .foregroundColor(Color("black"))
                            .font(.custom("Manrope-ExtraBold", size: 16))
                            .padding([.leading, .vertical], 16)
                        
                        Spacer()
                        
                        Image("faq.arrow")
                            .rotationEffect(opened ? Angle.degrees(0) : Angle.degrees(180))
                            .padding([.trailing, .vertical], 12)
                    }
                }
                .background(.white)
            }
            
            //MARK: - Bottom
            if opened {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("border"))
                ZStack {
                
//                    Color("light gray")
//                            .frame(maxHeight: height)
                    HStack {
                        Text("Основным фактором определяющим сумму, на которую вы можете претендовать, является Ваш кредитный рейтинг. Он складывается из вашей кредитной истории и соотношения долга к доходу")
                            .font(.custom("Inter-Regular", size: 16))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("black"))
                            .padding(20)
                    }
                }
                .background(Color("light gray"))
            }
        }
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(opened ? Color("orange") : Color(hexString: "border").opacity(0.08), lineWidth: 1)
        )
        .frame(minHeight: 80)
        .padding(.horizontal, 16)
    }
}

struct FaqQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        FaqQuestionView()
    }
}
