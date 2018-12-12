package com.prolificinteractive.devkit.all

class ValidationInfo(val validationType: ValidationType, val num: Int) {

    companion object {
        fun getRegexCode(validators: Array<ValidationInfo>): String {
            var regexCode = "^"
            for (validationInfo in validators) {
                regexCode += when (validationInfo.validationType) {
                    ValidationType.LOWERCASE_LETTERS -> "(?=.*[a-z])"
                    ValidationType.UPPERCASE_LETTERS -> "(?=.*[A-Z])"
                    ValidationType.NUMBERS -> "(?=.*[0-9])"
                    ValidationType.SPECIAL_CHARACTERS -> "(?=.*[!@#\$&*])"
                    ValidationType.MIN_CHARACTERS -> ".{" + validationInfo.num + ",}\$"
                }
            }
            return regexCode
        }
    }
}