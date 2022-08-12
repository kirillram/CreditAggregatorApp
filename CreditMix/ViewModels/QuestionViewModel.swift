//
//  QuestionViewModel.swift
//  CreditMix
//
//  Created by Кирилл on 05.08.2022.
//

import Foundation
import SwiftUI


class QuestionViewModel: ObservableObject {
    
    @Published var opened = false
    @Published var faqQuestions = [
        QuestionModel(question: "¿Cuánto me pueden prestar?", answer: "El principal factor que determina la cantidad que puede solicitar es su calificación crediticia. Se basa en su historial de crédito y en su relación entre la deuda y los ingresos"),
        QuestionModel(question: "¿Cuál es el crédito máximo que puedo pedir?", answer: "Por lo general, los nuevos clientes pueden recibir una aprobación de entre 1.000 y 20.000 El volumen del primer préstamo depende de los ingresos permanentes del prestatario, del plazo y del historial crediticio"),
        QuestionModel(question: "¿Aprobarán la solicitud sin el empleo oficial?", answer: "Sí, algunas empresas permiten solicitar préstamos a personas que no tienen un empleo oficial"),
        QuestionModel(question: "¿Qué documentos necesito para solicitar un préstamo?", answer: "Es obligatorio preparar un pasaporte en cualquier caso. Además, puede aportar todos los certificados y documentos que demuestren su solvencia, pero normalmente no es necesario. Cuantos más documentos tenga, más favorables pueden ser las condiciones"),
        QuestionModel(question: "¿Con qué rapidez se recibe el dinero?", answer: "El préstamo aprobado se transfiere desde unos minutos hasta unos días, dependiendo del servicio.")
    ]
    
    func chooseBorderColor() -> Color {
        return opened ? Color("orange") : Color("border").opacity(0.08)
    }
    
    func rotateButton() -> Angle {
        return opened ? Angle.degrees(0) : Angle.degrees(180)
    }
    
}
