//
//  AuthValidator.swift
//  Legato
//

import Foundation
import FirebaseAuth

struct AuthValidator {

    // Validates the user email and password before attempting a login request
    static func loginError(email: String, password: String) -> String? {
        if let emailMessage = emailError(email) {
            return emailMessage
        }
        // Makes sure that the password field is not left blank
        if password.isEmpty {
            return "Please enter your password."
        }
        return nil
    }
    
    // Validates all user information like userID, email, password
    static func signUpError(userID: String, email: String, password: String, confirmPassword: String) -> String? {
        if userID.isEmpty {
            return "Please enter a user ID."
        }
        if userID.contains(" ") {
            return "User ID can't have spaces."
        }
        if let emailMessage = emailError(email) {
            return emailMessage
        }
        if password.isEmpty {
            return "Please enter a password."
        }
        if password.count < 6 {
            return "Password must be at least 6 characters."
        }
        if password != confirmPassword {
            return "Passwords don't match."
        }
        return nil
    }
    
    // Displays error messages to the user if there are problems with Firebase Authentication
    static func firebaseErrorMessage(error: Error) -> String {
        let nsError = error as NSError
        guard let code = AuthErrorCode(rawValue: nsError.code) else {
            return "Something went wrong. Please try again."
        }
        
        switch code {
            case .invalidCredential, .wrongPassword, .userNotFound:
                return "Incorrect email or password."
            case .invalidEmail:
                return "Please enter a valid email address."
            case .emailAlreadyInUse:
                return "Email is already in use. Please use a different email."
            case .weakPassword:
                return "Password must be at least 6 characters."
            case .networkError:
                return "No internet connection. Please try again."
            case .tooManyRequests:
                return "Too many attempts. Please wait a moment and try again."
            default:
                return "Something went wrong. Please try again."
        }
    }
    
    // Helper method that checks if the email string is non empty and contains email characters like "@" and "."
    private static func emailError(_ email: String) -> String? {
        if email.isEmpty {
            return "Please enter your email."
        }
        if !email.contains("@") || !email.contains(".") {
            return "Please enter a valid email address."
        }
        return nil
    }
    
    // Validates the email input before requesting a password reset email
    static func forgotPasswordError(email: String) -> String? {
        return emailError(email)
    }
}
