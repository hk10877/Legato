//
//  SignUpViewController.swift
//  Legato
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else {
            signUpButtonTapped(textField)
        }
        return true
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        view.endEditing(true)
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        if let message = AuthValidator.signUpError(email: email, password: password, confirmPassword: confirmPassword) {
            errorLabel.text = message
            errorLabel.isHidden = false
            return
        }
        errorLabel.isHidden = true
        attemptSignUp(email: email, password: password)
    }

    @IBAction func logInButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    private func attemptSignUp(email: String, password: String) {
        performSegue(withIdentifier: "showMain", sender: self)
    }
}
