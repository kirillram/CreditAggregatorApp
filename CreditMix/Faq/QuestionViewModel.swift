//
//  QuestionViewModel.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import Foundation
import SwiftUI


struct QuestionModel: Hashable {
    let question: String
    let answer: String
}

class QuestionViewModel: ObservableObject {
    
    @Published var opened = false
    @Published var faqQuestions = [
        QuestionModel(question: "Сколько я могу занять?", answer: "Основным фактором определяющим сумму, на которую вы можете претендовать, является Ваш кредитный рейтинг. Он складывается из вашей кредитной истории и соотношения долга к доходу"),
        QuestionModel(question: "Какую максимальную сумму я могу занять?", answer: "Answer text"),
        QuestionModel(question: "Одобрят ли заявку без официального трудоустройства?", answer: "Answer text"),
        QuestionModel(question: "Какие документы понадобятся для оформления займа?", answer: "Answer text"),
        QuestionModel(question: "Как быстро приходят деньги?", answer: "Answer text")
    ]
    @Published var question: String = ""
    @Published var answer: String = ""
    
    func chooseBorderColor() -> Color {
        return opened ? Color("orange") : Color("border").opacity(0.08)
    }
    
    func rotateButton() -> Angle {
        return opened ? Angle.degrees(0) : Angle.degrees(180)
    }
    
}
