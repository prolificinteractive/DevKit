package com.prolificinteractive.devkit

import android.graphics.Color
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.prolificinteractive.devkit.all.FormValidator
import com.prolificinteractive.devkit.all.ValidationInfo
import com.prolificinteractive.devkit.all.ValidationType
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    private val formValidator = FormValidator()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loginButton.setOnClickListener {
            val validators = arrayOf(ValidationInfo(ValidationType.MIN_CHARACTERS, 5))

            if (formValidator.isValid(emailEditText.text.toString(), passwordEditText.text.toString(), validators)) {
                errorTextView.setTextColor(Color.GREEN)
                errorTextView.text = "Valid Credentials"
            } else {
                errorTextView.setTextColor(Color.RED)
                errorTextView.text = "Invalid Email or Password!"
            }
        }
    }
}
