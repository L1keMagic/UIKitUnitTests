//
//  FieldValidator.swift
//  UnitTestsApp
//
//  Created by Артур Карачев on 11.09.2021.
//

import Foundation
import UIKit

protocol FieldValidator {
    func validateLoginTextFields(loginTF: UITextField, passwordTF: UITextField) -> Bool
    
    func acyncValidateLoginTextFields(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void)
}

class FieldValidatorImpl: FieldValidator {
    
    func validateLoginTextFields(loginTF: UITextField, passwordTF: UITextField) -> Bool {
        return loginTF.hasText && passwordTF.hasText && passwordTF.text == "123"
    }
    
    func acyncValidateLoginTextFields(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1.5, execute: {
            DispatchQueue.main.async {
                let result = loginTF.hasText && passwordTF.hasText && passwordTF.text == "123"
                
                completion(result)
            }
        })
        
    }
}
