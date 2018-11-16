//
//  FormValidatorController.swift
//  DevKit_Example
//
//  Created by Stanle De La Cruz on 11/13/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import DevKit

class FormValidatorController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var validateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FormValidator"
    }
    @IBAction func validateAction(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {
                return
        }
        print(password)
        let isValidEmail = FormValidator.isValid(email)
        let isValidPassword = FormValidator.isValid(password, passwordType: .alphabetNumberSpecialCharacter, minCharacters: 0)
        print("Email: \(isValidEmail)")
        print("Password: \(isValidPassword)")
    }
}
