//
//  SettingsViewController.swift
//  Legato
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var echoDistanceSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIDTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        view.endEditing(true)
        let userID = userIDTextField.text ?? ""
        if userID.isEmpty {
            showAlert(title: "Missing User ID", message: "Please enter a user ID.")
            return
        }
        showAlert(title: "Saved", message: "Saving isn't connected yet.")
    }
    
    @IBAction func changePhotoTapped(_ sender: Any) {
        showAlert(title: "Coming Soon", message: "Changing your photo isn't available yet.")
    }
    
    @IBAction func linkSpotifyTapped(_ sender: Any) {
        showAlert(title: "Coming Soon", message: "Linking your Spotify account isn't available yet.")
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            view.window?.rootViewController?.dismiss(animated: true)
        } catch {
            self.showAlert(title: "Log out failed", message: error.localizedDescription)
        }
    }
    
    @IBAction func deleteAccountTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Account?", message: "This can't be undone.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive))
        present(alert, animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
