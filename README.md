# Notes on the Note Makers
The purpose of this mobile application, Notes on the Note Makers, will be to raise awareness and to educate teens and young adults about the classical composers and their important works, as well as introducing them to basic musical terms found in classical pieces and broaden the user’s general knowledge of music. 
# Release Notes Section
## Version 0.3.0
### Features
 - Added in-text link support, so users can quickly retrieve information referenced on other pages. 
 - Added a universal color palette 
 - Added individual pages for compositions 
 - Added individual pages for composers 
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
