**Contributions:**

* Alisha Madhuvarshi: (25%)  
  * Created the Firebase project and registered our iOS app with it.  
  * Enabled email/password sign-in in the Firebase console.  
  * Connected the Login screen to Firebase sign-in; the app now only moves to the main screen once Firebase approves the credentials.  
  * Connected the Sign up screen to Firebase account creation, keeping the existing local validation in ‘AuthValidator’  
  * Translated Firebase error codes into user-friendly messages in ‘AuthValidator’  
  * Connected Logout in Settings to Firebase sign-out, with error handling  
  * Added a User ID field to Sign Up, saved to the user’s Firebase profile and shown as @UserID on the Profile page.  
  * Added “Forgot password?” to the Login screen, which sends a Firebase password-reset email.  
* Harshita Kumari: (25%)  
  * Made the login, profile, and settings into separate storyboards so that we could work on different screens with fewer merge conflicts.  
  * Connected the screens (Login and signup, login to profile, and the gear icon to settings, and log out back to login) and made sure that all the screens were working and made changes if something broke.  
  * Added the shared colors and Legato logo to the app based on the design document.   
  * Applied all the changes for the colors across all the screens. Made sure that all the buttons, labels, and text fields had a consistent style.  
  * Built the main tab bar (Home, Stars, Echo, Listening Party, Search), with a separate storyboard for each tab.  
  * Connected the new screens with segues: Login/Sign Up → Home, Home → Profile, and album → Album →Now Playing → Comments.  
  * Added code comments and documentation across the Login, Sign Up, Profile, and Settings files.  
* Niranjan Sharma: (25%)  
  * Coded the login screen as the entry point with logo, email, and password fields, and a button to the signup screen  
  * Coded the signup screen with email, password, and confirm password labels, and a return to login screen button  
  * Wrote input validation in AuthValidator.swift using simple if else (checks for empty emails/passwords, checks that email contains an ‘@’,  checks the length and structure of password, and also ensures that the retyped password matches original password)  
  * Refined error logic, and made them display in real-time if authentication fails for any of the login or signup components  
  * Built actions and outlets for buttons, wherever needed  
  * Built the Home feed (“Recommended for you” and “Recently listened”) and the Stars page (“Top Rated” and “My Ratings”), each album showing its star rating. (Static data for now)  
  * Built the Album page with the cover, album info, average rating, and a tracklist with song ratings. (Static data for now)  
  * Created the view controller classes for the Home, Stars, Album, Now Playing, and Comments screens.  
* Harschitha Sundar: (25%)  
  * Coded the settings and profile pages; ensured that it functioned properly by testing different user flows   
  * Applied the agreed-upon UI design, including color scheme and font assets  
  * Helped implement segues from the settings/profile pages, created actions and outlets where needed   
  * Implemented table view on Profile page to showcase recently rated artists and songs, and a table view to showcase user’s listening parties, and added a placeholder user bio/icon. (Static data for now)  
  * Added placeholders for Firebase integration and future Spotify functionality  
  * Contributed to documentation for Alpha  
  * Built the Now Playing page with song info, a progress bar, play controls, and the user’s own star rating. (Static data)  
  * Built the Comments page with a mini player, comments with likes and replies, and a field to add a comment. (Static Data)

**Differences**: 

* In our proposal, we had the Stars and Pages features set to be delivered for alpha. However, in our actual alpha, instead of Pages, we decided to do the login/signup and profile pages instead (both of which we didn’t account for in our original proposal). But after the professor’s feedback, it made more sense to start out by building the entry point and our base first (the login/sign up page). To compensate for the lack of Pages in alpha release, we built out the entire fleshed out version of the profile/settings page (including tableviews for user activity and placeholders for linking to Spotify), and a fully-functioning login/signup page (complete with Firebase authentication and in-line error validation).  
* Different screens are also in this release: the Home feed, Stars page, Album page, Now Playing, and Comments, all using placeholder data. Saving ratings, calculating community averages, and posting comments need a database (Firestore), so that moves to the beta release along with Pages. The screens were not mentioned in our proposal.  
* In our proposal, we didn’t mention Firebase authentication. However, since we ended up doing the login/signup in the alpha release, it made more sense to implement Firebase authentication to securely support the real-time creation of a new user, existing user login, and overall account management.   
* In our proposal, we didn’t have the color scheme and logo outlined, but decided to implement that via an asset library, based upon our design (this way, we can all build consistent screens across the app).   
* We added the bottom tab bar from our design so users can move between the main sections. The Echo, Listening Party, and Search tabs are placeholders in this release and will be built in beta.  
* The design’s setup screens after sign up (Create Profile, User Permissions, Terms and Conditions) are pushed to beta so we could focus on the Stars screens. For now, the user’s User ID is collected on the Sign Up screen.  
* The light/dark mode setting from our design was left out of Settings to keep this release simple. Settings uses Notifications and Echo distance as its two changeable settings instead.
* All of these differences are because we didn't fully understand the detail we needed to go to in out proposal.

