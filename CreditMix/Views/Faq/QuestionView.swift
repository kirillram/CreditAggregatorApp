//
//  QuestionView.swift
//  CreditMix
//
//  Created by Кирилл on 04.08.2022.
//

import SwiftUI

struct QuestionView: View {
    
    @StateObject var qvModel = QuestionViewModel()
    
    @State var question: String
    @State var answer: String
    
    var body: some View {
        
        VStack(spacing:0) {
            //MARK: - Top
            
            Button {
                withAnimation {
                    qvModel.opened.toggle()
                }
            } label: {
                HStack{
                    Text(LocalizedStringKey(question))
                        .foregroundColor(Color("black"))
                        .font(.custom("Manrope-ExtraBold", size: 16))
                        .padding([.leading, .vertical], 16)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image("faq.arrow")
                        .rotationEffect(qvModel.rotateButton())
                        .padding([.trailing, .vertical], 12)
                }
            }
            .background(.white)
            
            
            //MARK: - Bottom
            if qvModel.opened {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("border"))
                
                HStack {
                        Text(LocalizedStringKey(answer))
                            .font(.custom("Inter-Regular", size: 16))
                            .foregroundColor(Color("black"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(20)
                            .multilineTextAlignment(.leading)
                    }
                    .background(Color("light gray"))
            }
        }
        .background(Color("light gray"))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(qvModel.chooseBorderColor(), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

struct  zsad_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.red
            QuestionView(question: "¿Cuánto me pueden prestar?", answer: "El principal factor que determina la cantidad que puede solicitar es su calificación crediticia. Se basa en su historial de crédito y en su relación entre la deuda y los ingresos")
        }
    }
}
