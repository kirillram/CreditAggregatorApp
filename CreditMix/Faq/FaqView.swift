//
//  FaqView.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI

struct FaqView: View {
    
    @StateObject var qvModel = QuestionViewModel()
    
    var body: some View {
        VStack {
            ForEach(qvModel.faqQuestions, id: \.self) { item in
                QuestionView(question: item.question, answer: item.answer)
        }
        }
        .padding(.top, 24)
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        FaqView()
    }
}
