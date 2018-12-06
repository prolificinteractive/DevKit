package com.prolificinteractive.devkit.all

import android.util.Patterns.EMAIL_ADDRESS

class FormValidator {

    fun isValid(password: String, validators: Array<ValidationInfo>): Boolean {
        return isValid(password, ValidationInfo.getRegexCode(validators))
    }

    fun isValid(email: String, password: String, validators: Array<ValidationInfo>): Boolean {
        return isValid(email) && isValid(password, validators)
    }

    fun isValid(email: String,
                password: String,
                confirmationPassword: String,
                validators: Array<ValidationInfo>): Boolean {
        return isValid(email)
                && password == confirmationPassword
                && isValid(password, validators)
    }

    fun isValid(email: String, password: String, passwordRegex: String): Boolean {
        return isValid(email) && isValid(password, passwordRegex)
    }

    fun isValid(email: String,
                password: String,
                confirmationPassword: String,
                passwordRegex: String): Boolean {
        return isValid(email)
                && password == confirmationPassword
                && isValid(password, passwordRegex)
    }

    fun isValid(password: String, passwordRegex: String): Boolean {
        return password.matches(Regex(passwordRegex))
    }

    fun isValid(email: String): Boolean {
        return EMAIL_ADDRESS.matcher(email).matches()
    }
}