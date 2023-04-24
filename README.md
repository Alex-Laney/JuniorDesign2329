# Notes on the Note Makers
The purpose of this mobile application, Notes on the Note Makers, will be to raise awareness and to educate teens and young adults about the classical composers and their important works, as well as introducing them to basic musical terms found in classical pieces and broaden the user’s general knowledge of music. 

# Documentation
- [V1.0.0 Release Notes](https://github.com/Alex-Laney/JuniorDesign2329#notes-on-the-note-makers-version-100-release-notes)
  - [New Software Features](https://github.com/Alex-Laney/JuniorDesign2329#new-software-features)
  - [Bug Fixes](https://github.com/Alex-Laney/JuniorDesign2329#bug-fixes)
  - [Known Bug/Defects](https://github.com/Alex-Laney/JuniorDesign2329#known-bugsdefects)
- [Installation Guide](https://github.com/Alex-Laney/JuniorDesign2329#installation-guide-for-notes-on-the-note-makers)
  - [Pre-requisites](https://github.com/Alex-Laney/JuniorDesign2329#pre-requisites)
  - [Dependent Libraries](https://github.com/Alex-Laney/JuniorDesign2329#dependent-libraries)
  - [Download Instructions](https://github.com/Alex-Laney/JuniorDesign2329#download-instructions)
  - [Build Instructions](https://github.com/Alex-Laney/JuniorDesign2329#build-instructions)
  - [Deployment Instructions](https://github.com/Alex-Laney/JuniorDesign2329#deployment-instructions)
  - [Installation of Actual Application](https://github.com/Alex-Laney/JuniorDesign2329#installation-of-actual-application)
  - [Run Instructions](https://github.com/Alex-Laney/JuniorDesign2329#run-instructions)
  - [Troubleshooting](https://github.com/Alex-Laney/JuniorDesign2329#troubleshooting)
- [Past Release Notes](https://github.com/Alex-Laney/JuniorDesign2329#past-release-notes)

# Notes on the Note Makers Version 1.0.0 Release Notes
## New Software Features
- Added main screen for the Composers module
- Added main screen for the Musical Terms module
- Added main screen for the Musical Works module
- Added main screen for the Quizzes module
- Added module dial for the Home screen
- Added temporary module dial for all other module screens
- Added musical term database
- Implemented Musical Terms menu
- Implemented Definition pages for each musical term
- Added ability to sort terms alphabetically, reverse alphabetically, and by tag
- Added licensing terms and agreements
- Implemented Help menu templates for each module
- Implemented Listening screen and in-app audio player
- Added in-text link support, so users can quickly retrieve information referenced on other pages.
- Added a universal color palette
- Added individual pages for compositions
- Added individual pages for composers
- Added ability to transition from listen module to the song composer's information page
- An initial mockup of an App Store page has been created
- Information related to the composers has been collected and added to their pages
- Information related to the compositions has been collected and added to their pages
- Added local storage for quiz results
- Remediated the user interface of the main menu
- Added a splash screen
- Added a new initial screen that works with the splash screen to provide a 'music box introduction'
- Added information in the Help module pertaining to the Terms module
- Added information in the Help module pertaining to the Works module
- Added information in the Help module pertaining to the Composers module
- Added a mute button to the settings screen
- Added quizzes about composers and compositions
- Revamped Settings screen user interface
- Added song name to Listen module
- Added music to initial screen
- Added Quizzes menu
- Added help menu page for Quizzes
- Added functionality to earn reward points from Quizzes
- Added ability to purchase rewards
- Added 8 reward images to be purchased
## Bug Fixes
- 'Linkable interface' has been implemented as a fix to the problem where terms could not be accessed outside of the 'Terms' module
- Sliver List functionality has been removed from the 'Works' module viewing list, and has been replaced with a standard 'safe zone' as used in the 'Terms' module
- The code for the Floating Action Button had been accidentally copied twice into the Musical-Terms.dart file and has been remediated
- An additional parenthesis was needed in the Definition-Page.dart file and has been remediated
- just_audio is now global
- Long-standing known issue of "Music plays in background after beginning, and leaving Listen module and returning back allows for songs to overlap" has been fixed
- Issue in previous sprint of Listen to ___ buttons all link to the same song" has been fixed
- Nearly all buttons in the app are reworked visually
- Some background images have been added to fill dead space
- Back buttons are static across the app now, they were all over the place before
- “bufferoverflow” bugs were prevalent on smaller devices, but those are remediated now
## Known Bugs/Defects
- Text does not scale universally. In that, in theory it is possible for a mobile device to have a screen small enough to cause the text to overwhelm the screen as to where the app is no longer usable. We tested on the smallest modern phones possible such that this should not be a large issue, but it is known.
- The mute button has two known defects: one is that it does not store your selection between uses of the app, and the other is that the symbol is that of the opposite of what is happening. In that, if the app is muted it shows a “sound on” button, as though to say that pressing the button puts the sound on. We are aware that this may not be clear to the user.
- A known defect is that the home page will attach itself to the top of your screen, which can look odd on taller screens with a large empty space at the bottom. 
# Installation Guide for Notes on the Note Makers

## Pre-requisites

Before you can install and run Notes on the Note Makers, you need to have the following software and hardware:

- A computer running Windows, macOS, Linux or Chrome OS
    
- A compatible Android or iOS device or emulator
    
- The Flutter SDK and command-line tools
    
- An IDE, such as [<ins>Android Studio</ins>](https://docs.flutter.dev/get-started/editor?tab=androidstudio), [<ins>Visual Studio Code</ins>](https://docs.flutter.dev/get-started/editor?tab=vscode), [<ins>IntelliJ IDEA</ins>](https://docs.flutter.dev/get-started/editor?tab=androidstudio), or an editor, such as [<ins>Emacs</ins>](https://docs.flutter.dev/get-started/editor?tab=emacs), that supports Flutter development
    
- A valid Apple Developer account and Google Play Developer account if you want to deploy your app to the App Store and Google Play Store
    

You can follow the instructions [<ins>here</ins>](https://docs.flutter.dev/get-started/install) to set up your development environment and install the Flutter SDK.

## Dependent Libraries

The Notes on the Note Makers application depends on some third-party packages that provide additional functionality and features. You can find the list of dependencies in the pubspec.yaml file in the project directory. To install these packages, you need to run the following command in a terminal:

```console
flutter pub get
```

This will download and install all the required packages in the `pubspec.lock` file.

## Download Instructions

To download the source code of Note on the Note Makers, you need to have access to the project repository on GitHub. You can either clone the repository using Git or download a ZIP file of the latest version.

To clone the repository using Git, run the following command in a terminal:

```bash
git clone https://github.com/Alex-Laney/JuniorDesign2329.git
```

To download a ZIP file of the latest version, go to the [project page](https://github.com/Alex-Laney/JuniorDesign2329) on GitHub and click on the “Code” button. Then select “Download ZIP” from the dropdown menu. Save the file to your desired location and extract it.

## Build Instructions

To build the Flutter mobile application, you need to run the following command in a terminal:

```console
flutter build <platform>
```

Replace `<platform>` with either `apk` for Android or `ios` for iOS. This will create a binary file that can be installed on your device or emulator.

Alternatively, you can use your IDE or editor to build and run your app. Refer to [<ins>Android Studio</ins>](https://docs.flutter.dev/get-started/test-drive?tab=androidstudio#:~:text=of%20that%20file.-,Run%20the%20app,-Locate%20the%20main), [<ins>Visual Studio Code</ins>](https://docs.flutter.dev/get-started/test-drive?tab=vscode#:~:text=of%20that%20file.-,Run%20the%20app,-Locate%20the%20VS), [<ins>IntelliJ IDEA</ins>](https://docs.flutter.dev/get-started/test-drive?tab=androidstudio#:~:text=of%20that%20file.-,Run%20the%20app,-Locate%20the%20main), or [<ins>Emacs</ins>](https://docs.flutter.dev/get-started/test-drive?tab=terminal#:~:text=of%20that%20file.-,Run%20the%20app,-Check%20that%20an) for more details on how to use different IDEs or editors with Flutter.

## Deployment Instructions

To deploy your Flutter mobile application to the App Store and Google Play Store, you need to follow some additional steps to prepare your app for distribution.

For iOS, you need to create an app bundle identifier, register your app on App Store Connect, create a distribution certificate and provisioning profile, configure Xcode settings, archive and upload your app, and submit it for review. You can follow the instructions [<ins>here</ins>](https://docs.flutter.dev/deployment/ios) for more details.

For Android, you need to create an app icon, configure an application ID, generate a signing key, sign your app bundle or APK, test your release build, enroll in Google Play App Signing (optional), create a Google Play Console account and upload your app. You can follow the instructions [<ins>here</ins>](https://docs.flutter.dev/deployment/android) for more details.

## Installation of Actual Application

To install the Flutter mobile application on your device or emulator, you need to transfer the binary file that you built in the previous step ([<ins>Build Instructions</ins>](https://github.com/Alex-Laney/JuniorDesign2329#build-instructions)).

For iOS, you can use Xcode or iTunes to install your app on your device. You can also use TestFlight to distribute your app to testers. Refer [<ins>here</ins>](https://docs.flutter.dev/deployment/ios) for more details.

For Android, you can use Android Studio or adb (Android Debug Bridge) to install your app on your device or emulator. You can also use Google Play Console to distribute your app to testers. Refer [<ins>here</ins>](https://docs.flutter.dev/deployment/android) for more details.

## Run Instructions

To run the Flutter mobile application on your device or emulator, you need to tap on the app icon that appears on your home screen. This will launch the app and display its main screen.

You can also use your IDE or editor to run your app directly from your computer. Refer [<ins>here</ins>](https://docs.flutter.dev/get-started/install) for more details on how to use different IDEs or editors with Flutter.

## Troubleshooting

Here are some common problems you might face during installation and running the application:

- Problem: The flutter command is not recognized in your terminal or command prompt.
    - Solution: Make sure you have added the flutter/bin directory to your system path. You can follow the instructions [<ins>here</ins>](https://flutter.dev/docs/get-started/install) for different operating systems.

- Problem: The flutter doctor command shows some issues with your Android SDK or emulator.
	- Solution: Make sure you have installed the Android SDK and emulator correctly. You can follow the instructions [<ins>here</ins>](https://flutter.dev/docs/get-started/install/windows#android-setup) for Windows or [<ins>here</ins>](https://flutter.dev/docs/get-started/install/macos#android-setup) for macOS. You may also need to accept the Android licenses by running `flutter doctor --android-licenses`.

- Problem: The flutter run command fails to launch your app on a device or emulator.
	- Solution: Make sure you have enabled developer mode and USB debugging on your device, or that your emulator is running and connected. You can check the list of available devices by running `flutter devices`. You may also need to run `flutter clean` to clear any cached files before running your app again.

- Problem: The app crashes or shows errors on the device or emulator screen.
	- Solution: Make sure you have followed the steps in the download instructions section to create and run a simple app. You can also use the [<ins>debugging tools</ins>](https://flutter.dev/docs/testing/debugging) to inspect the app state and find the source of the errors. You may also need to update your flutter SDK by running `flutter upgrade` or switch to a stable channel by running `flutter channel stable`.
    

If you encounter any errors or issues during the installation process that were not covered above, you can try some of the following steps or contact us via [<ins>jsinger32@gatech.edu</ins>](mailto:jsinger32@gatech.edu):

- Check if you have met all the prerequisites and installed all the dependent libraries
    
- Check if you have followed all the build and deployment instructions correctly
    
- Check if you have selected the correct platform and configuration for your app
    
- Check if you have signed your app with a valid certificate and provisioning profile
    
- Don’t have sufficient space to download app: Check if you have enough storage space and battery power on your device or emulator
    
- Check if you have a stable internet connection and access to the app store or play store
    
- Check if you have the latest version of Flutter and your IDE or editor
    
- Features are missing from the app: Check if there are any updates or bug fixes available for your app
    
- Check the Flutter documentation and community forums for more help and solutions

# Past Release Notes
## Version 0.5.0
### Features
 - Added functionality to earn reward points from Quizzes
 - Added ability to purchase rewards
 - Added 8 reward images to be purchased
### Bug Fixes
- Nearly all buttons in the app are reworked visually
- Some background images have been added to fill dead space
### Known Issues
- 
## Version 0.4.0
### Features
 - Added local storage for quiz results
 - Remediated the user interface of the main menu
 - Added a splash screen
 - Added a new initial screen that works with the splash screen to provide a 'music box introduction'
 - Added information in the Help module pertaining to the Terms module
 - Added information in the Help module pertaining to the Works module
 - Added information in the Help module pertaining to the Composers module
 - Added a mute button to the settings screen
 - Added quizzes about composers and compositions
 - Revamped Settings screen user interface
 - Added song name to Listen module
 - Added music to initial screen
 - Added Quizzes menu 
 - Added help menu page for Quizzes
### Bug Fixes
- just_audio is now global
- Long-standing known issue of "Music plays in background after beginning, and leaving Listen module and returning back allows for songs to overlap" has been fixed
- Issue in previous sprint of ""Listen to ___" buttons all link to the same song" has been fixed
### Known Issues
- The song name in the Listen module is not updated automatically while you are looking at it, you have to leave the module and come back for it to update
- The home button in the quiz results screen goes back to the splash screen rather than the main menu
## Version 0.3.0
### Features
 - Added in-text link support, so users can quickly retrieve information referenced on other pages. 
 - Added a universal color palette 
 - Added individual pages for compositions 
 - Added individual pages for composers 
 - Added ability to transition from listen module to the song composer's information page
 - An initial mockup of an App Store page has been created 
 - Information related to the composers has been collected and added to their pages 
 - Information related to the compositions has been collected and added to their pages 
### Bug Fixes
 - 'Linkable interface' has been implemented as a fix to the problem where terms could not be accessed outside of the 'Terms' module
 - Sliver List functionality has been removed from the 'Works' module viewing list, and has been replaced with a standard 'safe zone' as used in the 'Terms' module
 - The code for the Floating Action Button had been accidentally copied twice into the Musical-Terms.dart file and has been remediated
 - An additional parenthesis was needed in the Definition-Page.dart file and has been remediated 
### Known Issues
- Songs will play in the background when leaving the ‘Listen’ module 
- Returning to the ‘Listen’ module with a song playing in the background will allow you to play multiple songs concurrently, which is not intended 
- Sonata 8 Pathetique 1st Movement ends prematurely 
- "Listen to ___" buttons all link to the same song
## Version 0.2.0
### Features
- Added musical term database 
- Implemented Musical Terms menu 
- Implemented Definition pages for each musical term 
- Added ability to sort terms alphabetically, reverse alphabetically, and by tag
- Added licensing terms and agreements
- Implemented Help menu templates for each module 
- Implemented Listening screen and in-app audio player

### Bug Fixes
N/A
### Known Issues
- Music plays in background after beginning, and leaving Listen module and returning back allows for songs to overlap
- Sorting by tag does not work for terms with multiple tags (no such terms as of yet) 
- Listen screen does not display the name of the current song 
- Reverse alphabetical sorting not displayed as drop-down menu option 

## Version 0.1.0
### Features
- Added main screen for the Composers module
- Added main screen for the Musical Terms module 
- Added main screen for the Musical Works module 
- Added main screen for the Quizzes module
- Added module dial for the Home screen
- Added temporary module dial for all other module screens

### Bug Fixes
N/A
### Known Issues
N/A
