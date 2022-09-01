//
//  QuestionViewModel.swift
//  CashCredit
//
//  Created by Кирилл on 05.08.2022.
//

import Foundation
import SwiftUI


class QuestionViewModel: ObservableObject {
    
    @Published var opened = false
    @Published var faqQuestions = [
        QuestionModel(question: "How much can I borrow?", answer: "The main factor that determines how much you can borrow is your credit score. It is based on your credit history and your debt-to-income ratio."),
        QuestionModel(question: "What is the maximum credit I can borrow?", answer: "Generally, new customers can be approved for between 1,000 and 20,000 The size of the first loan depends on the borrower's ongoing income, term and credit history."),
        QuestionModel(question: "Will they approve the application without the official job?", answer: "Yes, some companies allow people who are not formally employed to apply for loans."),
        QuestionModel(question: "What documents do I need to apply for a loan?", answer: "It is mandatory to prepare a passport in any case. In addition, you can provide all certificates and documents proving your solvency, but normally it is not necessary. The more documents you have, the more favorable the conditions may be."),
        QuestionModel(question: "How quickly do you receive the money?", answer: "The approved loan is transferred from a few minutes to a few days, depending on the service.")
    ]
    
    func chooseBorderColor() -> Color {
        return opened ? Color("dark green") : Color("border").opacity(0.08)
    }
    
    func rotateButton() -> Angle {
        return opened ? Angle.degrees(0) : Angle.degrees(180)
    }
    
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        FaqPageView()
    }
}
