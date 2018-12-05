package com.prolificinteractive.devkit

import android.graphics.Color
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
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

    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    external fun stringFromJNI(): String

    companion object {

        // Used to load the 'native-lib' library on application startup.
        init {
            System.loadLibrary("native-lib")
        }
    }
}
