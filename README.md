# Swift: Biometric authentication
## - a study -

¡Hola mundo!

In the project I work we have biometric authentication and this has been a huge mistery for me. But the time has come! I decided I wanted to learn a little bit more about it. How does it work and how it is managed.

This is a super simple study repo to put on practice biometrics authentication in Swift.

## Features 📋

- A login button that must call biometrics
- If the authentication is successful the user must enter the app, and maybe find The Secret of Monkey Island ™
- If the authentication fails we must ask the user their device PIN
 
## Built with 🔨

- XCode
- Swift
- SwiftUI

## Development ⌨️
 
### Views 👀 
There are two simple views, one with a button to login. This button is the one that will request the biometrics. The `LoginView` will only be rendered if the user is not already logged in. This is managed with a Published variable in our AppState called `loggedIn`. 

When this variable value changes to true we show the ContentView that is - or not - The Secret of Monkey Island ™. In the real life this would be a real app.

### Biometrics and AppState 📱
Apple documentation is very good regarding this. I've created an `AppState` file where I manage my authentication methods and variables. There are three different methods here:

- `checkBiometricsAvailability()` this method checks if the user has biometrics active. If the `BiometryType` is different than none, that means that it has finger or face ID activated. So it will return a true value. 
If not it will be false. I've decided not to manage the false value because for the end of this repo is not useful.

- `requestBiometrics()`is the main one. Here we first call the `checkBiometricsAvailability()` if this returns a true then it will show the Finger or FaceId native interface.
If the authentication is successful the `loggedIn` variable is set to true and as is Published the view will reload to show the app.
If the authentication fails, I'm managing the errors inside a switch where in the case that the authentication fails or the user cancels the authentication prompt then we call the third and last method `requestPinAuthentication()`

- `requestPinAuthentication()` this method shows a prompt and ask the user to enter their device PIN in order to authenticate their identity.

<img src="https://github.com/silviaespanagil/biometrics-authentication/assets/81619759/d2924d01-f338-4c50-975c-8496d31f2022" alt="" width="210"/>  <img src="https://github.com/silviaespanagil/biometrics-authentication/assets/81619759/3c597d88-9681-4e31-9d93-4c5c5379cf8f" alt="" width="210"/> 

## Check out the app in motion 👀🎬

### Biometrics success
https://github.com/silviaespanagil/biometrics-authentication/assets/81619759/a4968237-f182-4f36-a42a-76ed8c5afa55

### Biometrics fails, pin is requested
https://github.com/silviaespanagil/biometrics-authentication/assets/81619759/0169c95b-2f37-4096-899c-b637e7568f8b

## Want to fork this repo? 🐑
Please feel free and let me know what amazing things you have done.

