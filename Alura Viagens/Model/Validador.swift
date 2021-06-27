//
//  Validador.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 26/06/21.
//

import UIKit

class Validador: NSObject {
    
    func validaTextFields(_ textFields: [UITextField?]) -> Bool {
        for textField in textFields {
            if let text = textField?.text, text.isEmpty {
                return false
            }
        }
        return true
    }

}
