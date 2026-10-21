//
//  SignUpViewController.swift
//  Legato
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userIDTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        userIDTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userIDTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
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
        let userID = userIDTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        if let message = AuthValidator.signUpError(userID: userID, email: email, password: password, confirmPassword: confirmPassword) {
            errorLabel.text = message
            errorLabel.isHidden = false
            return
        }
        errorLabel.isHidden = true
        attemptSignUp(userID: userID, email: email, password: password)
    }

    @IBAction func logInButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    private func attemptSignUp(userID: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorLabel.text = AuthValidator.firebaseErrorMessage(error: error)
                self.errorLabel.isHidden = false
                return
            }
            let changeRequest = authResult?.user.createProfileChangeRequest()
            changeRequest?.displayName = userID
            changeRequest?.commitChanges { _ in
                self.performSegue(withIdentifier: "showMain", sender: self)
            }
        }
    }
}
