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

    private var validator = FormValidator()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FormValidator"
    }
    @IBAction func validateAction(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {
                return
        }
        let isValidEmail = validator.isValid(email)
        let isValidPassword = validator.isValid(password, validators: [.lowercasedLetters(num: 1),
                                                                       .numbers(num: 1),
                                                                       .uppercasedLetters(num: 1),
                                                                       .specialCharacters(num: 1),
                                                                       .minCharacters(num: 1)])
        print("Email: \(isValidEmail)")
        print("Password: \(isValidPassword)")
    }
}
