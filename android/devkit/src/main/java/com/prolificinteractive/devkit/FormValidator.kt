package com.prolificinteractive.devkit

class FormValidator {

    fun isValid(password: String, validators: Array<ValidationType>): Boolean {
        return isValid(password, ValidationType.getRegexCode(validators))
    }

    fun isValid(email: String, password: String, validators: Array<ValidationType>): Boolean {
        return isValid(email) && isValid(password, validators)
    }

    fun isValid(email: String,
                password: String,
                confirmationPassword: String,
                validators: Array<ValidationType>): Boolean {
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
        // TODO: Regex
        return true
    }

    fun isValid(email: String): Boolean {
        // TODO: Regex
        return true
    }
}