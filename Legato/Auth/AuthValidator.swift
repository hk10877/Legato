//
//  AuthValidator.swift
//  Legato
//

import Foundation
import FirebaseAuth

struct AuthValidator {

    static func loginError(email: String, password: String) -> String? {
        if let emailMessage = emailError(email) {
            return emailMessage
        }
        if password.isEmpty {
            return "Please enter your password."
        }
        return nil
    }

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

    private static func emailError(_ email: String) -> String? {
        if email.isEmpty {
            return "Please enter your email."
        }
        if !email.contains("@") || !email.contains(".") {
            return "Please enter a valid email address."
        }
        return nil
    }
    
    static func forgotPasswordError(email: String) -> String? {
        return emailError(email)
    }
}
