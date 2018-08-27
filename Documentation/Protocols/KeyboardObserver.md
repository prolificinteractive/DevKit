# Keyboard Observer
(Protocols/KeyboardObserver)

Contains UIViewController extension that easily adds keyboard observers. 

```
    override func viewDidLoad() {
        super.viewDidLoad()
        addRecognizerForKeyboardDismissal()
    }

```

To hide the keyboard when the user taps on the view add the `addRecognizerForKeyboardDismissal` to the viewDidLoad function.


```
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }

	override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }

```

Add the keyboard observer functions to `viewWillAppear` and `viewWillDisappear` respectively. Adding them will allow the view controller to call the functions below when the keyboard is shown or hidden.


```
	override func keyboardWillShow(notification: Notification) {
        // Handle keyboard will show action
    }
    
    override func keyboardWillHide(notification: Notification) {
        // Handle keyboard will hide action
    }

```

The functions above will be called when the keyboard is shown or hidden.