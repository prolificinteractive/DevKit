package com.prolificinteractive.devkit

enum class ValidationType {
    LOWERCASE_LETTERS,
    UPPERCASE_LETTERS,
    NUMBERS,
    SPECIAL_CHARACTERS,
    MIN_CHARACTERS;

    companion object {
        fun getRegexCode(validators: Array<ValidationType>): String {
            return ""
        }
    }

}