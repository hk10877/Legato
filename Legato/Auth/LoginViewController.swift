//
//  LoginViewController.swift
//  Legato
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets for Labels and text fields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    // Assign delegates for text fields
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // Helps with triggering login and advancing from email to password field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonTapped(textField)
        }
        return true
    }
    
    // Validates user credientials and starts firebase sign in
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
    
    // Sends a password reset link through firebase auth to address entered in the email field
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        view.endEditing(true)
        let email = emailTextField.text ?? ""
        // checks if the password is properly formatted
        if let message = AuthValidator.forgotPasswordError(email: email) {
            errorLabel.text = message
            errorLabel.isHidden = false
            return
        }
        errorLabel.isHidden = true
        
        // Request firebase to reset the password
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                self.errorLabel.text = AuthValidator.firebaseErrorMessage(error: error)
                self.errorLabel.isHidden = false
                return
            }
            let alert = UIAlertController(title: "Check Your Email", message: "If an account exists for \(email), we sent a link to reset your password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    // Authenticates the user with firebase using email and password
    // Also segues to profile screen
    private func attemptLogin(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorLabel.text = AuthValidator.firebaseErrorMessage(error: error)
                self.errorLabel.isHidden = false
                return
            }
            
            // successful sign-in
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
}
