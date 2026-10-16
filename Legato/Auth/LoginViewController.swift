//
//  LoginViewController.swift
//  Legato
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonTapped(textField)
        }
        return true
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        view.endEditing(true)
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if let message = AuthValidator.loginError(email: email, password: password) {
            errorLabel.text = message
            errorLabel.isHidden = false
            return
        }
        errorLabel.isHidden = true
        attemptLogin(email: email, password: password)
    }

    private func attemptLogin(email: String, password: String) {
        performSegue(withIdentifier: "showMain", sender: self)
    }
}
