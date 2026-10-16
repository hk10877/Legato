//
//  AuthValidator.swift
//  Legato
//

import Foundation

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

    static func signUpError(email: String, password: String, confirmPassword: String) -> String? {
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

    private static func emailError(_ email: String) -> String? {
        if email.isEmpty {
            return "Please enter your email."
        }
        if !email.contains("@") || !email.contains(".") {
            return "Please enter a valid email address."
        }
        return nil
    }
}
