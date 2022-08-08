//
//  FaqView.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI

struct FaqPageView: View {
    
    @StateObject var qvModel = QuestionViewModel()
    
    var body: some View {
        VStack {
            ForEach(qvModel.faqQuestions, id: \.self) { item in
                QuestionView(question: item.question, answer: item.answer)
            }
        }
        .padding(.top, 84)
        .padding(.bottom, 94)
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
