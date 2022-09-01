//
//  FaqView.swift
//  CashCredit
//
//  Created by Кирилл on 05.08.2022.
//

import SwiftUI

struct FaqPageView: View {
    
    @StateObject var qvModel = QuestionViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                
                //MARK: - Padding top
                HStack {}
                    .frame(height: 84)
                
                //MARK: - FAQ
                ForEach(qvModel.faqQuestions, id: \.self) { item in
                    QuestionView(question: item.question, answer: item.answer)
                }
                
                //MARK: - Padding bottom
                HStack {}
                    .frame(height: 94)
            }
        }
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
