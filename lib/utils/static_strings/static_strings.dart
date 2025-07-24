class AppStrings {
  ///====================== Initial ========================
  static const String appName = "I'm on\nthe phone";
  static const String appTagLine = "Track items, \nCalculate, Together";
  static const String getStarted = "Get Started";
  static const String welcome = "Welcome";

  ///====================== Auth ========================
  static const String signUp = "Sign Up";
  static const String signIn = "Sign In";
  static const String adminSignUp = "Admin Sign up";
  static const String or = "Or";
  static const String email = "Email";
  static const String fullName = "Full Name";
  static const String employee = "Employee";
  static const String admin = "Admin";
  static const String successful = "Successful";

  // Added missing auth strings
  static const String fullNameRequired = "Full name is required";
  static const String fullNameMinLength =
      "Full name must be at least 2 characters";
  static const String emailRequired = "Email is required";
  static const String enterValidEmail = "Please enter a valid email address";
  static const String passwordRequired = "Password is required";
  static const String confirmPasswordRequired = "Confirm password is required";
  static const String passwordsDoNotMatch = "Passwords do not match";
  static const String validationError = "Validation Error!";
  static const String pleaseFixErrors = "Please fix the errors in the form";
  static const String success = "Success!";
  static const String accountCreatedSuccessfully =
      "Account created successfully!";
  static const String error = "Error!";
  static const String failedToCreateAccount =
      "Failed to create account. Please try again.";
  static const String warning = "Warning!";
  static const String pleaseEnterEmail = "Please enter email";
  static const String welcome_title = "Welcome!";
  static const String adminLoginSuccessful = "Admin login successful";
  static const String userLoginSuccessful = "User login successful";
  static const String invalidCredentials = "Invalid Credentials!";
  static const String enterAdminOrUser =
      "Please enter \"admin\" or \"user\" in email field";
  static const String info = "Info";
  static const String googleLoginNotImplemented =
      "Google login not implemented yet";
  static const String appleLoginNotImplemented =
      "Apple login not implemented yet";
  static const String creatingAccount = "Creating Account...";

  static const String congratulations =
      "Congratulations! Your password has been changed. Click continue to login";
  static const String emailText = 'contact@dscode...com';
  static const String passwordReset = "Password reset";
  static const String enterYourEmailHint = "Enter your email";
  static const String reEnterPassword = "Re-enter password";
  static const String confirmPasswordHint = "Confirm Password";
  static const String monthlyReport = 'Monthly Report';
  static const String updatePassword = 'Update Password';
  static const String resendEmail = 'Resend email';
  static const String setANewPassword = 'Set a new password';
  static const String monthlyGrocerySpending = 'Monthly Grocery Spending';
  static const String totalExpenses = 'Total expenses';
  static const String viewBreakdown = 'View Breakdown';
  static const String trackTotalSpent = 'Track total spent';
  static const String totalSpent = 'Total Spent';
  static const String budgetLimit = 'Budget Limit';
  static const String groceryItems = 'Grocery Items';
  static const String underBudget = 'Under budget';
  static const String recentPurchases = 'Recent Purchases';
  static const String createANewPassword =
      'Create a new password. Ensure it differs from\nprevious ones for security';
  static const String youEmail = "You Email";
  static const String enterYourFullName = "Enter your full name";
  static const String enterYourNewPassword = "Enter your new password";
  static const String confirmYourNewPassword = "Confirm your new password";
  static const String enterYourCurrentPassword = "Enter your current password";
  static const String pleaseEnterYourEmailToReset =
      "Please enter your email to reset the password";
  static const String weSent = 'We sent a reset link to ';
  static const String checkYourEmail = 'Check your email';
  static const String haveNotGotTheMail = "Haven't got the email yet? ";
  static const String verifyCode = 'Verify Code';
  static const String enterYour5Digit =
      'Enter the 5-digit code mentioned in the email';
  static const String confirm = 'Confirm';
  static const String confirmPassword =
      'Your password has been successfully reset. click confirm to set a new password';
  static RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$");
  static const String password = "Password";
  static const String currentPassword = "Current Password";
  static const String newPassword = "New Password";
  static const String confirmNewPassword = "Confirm New Password";
  static const String passwordHint = "********";
  static const String passWordMustBeAtLeast =
      "Password must contain at least one uppercase letter, one lowercase letter, one number";
  static RegExp passwordRegex =
      RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?!^\d+$)(?!^[a-zA-Z]+$).{8,}$');
  static const fieldCantNotBeEmpty = "Field can't be empty";
  static const String passwordLengthAndContain =
      "Password must be at least 8 characters long and at least one uppercase letter, one lowercase letter, one number";
  static const String forgotPassword = "Forget password?";
  static const String doYouHaveAnAccount = "Do you have an account?";
  static const String rememberMe = "Remember me";
  static const String dontHaveAAccount = "Don't have a account? ";

  ///====================== SubsCription ========================
  static const String subscribe = "Subscribe";
  static const String skip = "Skip";
  static const String getUnlimitedAccess =
      "Get unlimited access to our programs.";
  static const String takeTheFirstStep =
      "Go Premium for unlimited calls, exclusive ringtones, and customizable call times. Upgrade now!";
  static const String popular = "POPULAR";
  static const String forMoreAccess = "For more Access";
  static const String sixtyPointNoneNine = "\$60.99";
  static const String forOneYear = "For 1 year";
  static const String unlimitedAccess = "Unlimited access";
  static const String viewMonthlyRecord = "View monthly record";
  static const String youWillBe =
      "You will be charged \$9.99 (monthly plan) or \n \$60.99 (annual plan) through your iTunes \n account. You can cancel at any time if your \n not satisfied.";
  static const String appleStorePay = "Apple Store pay";
  static const String unlockExclusivefeatures =
      'Unlock exclusive features and supercharge your dating experience.';
  static const String completeYourPurchase = "Complete your Purchase";
  static const String upgradeNow = 'Upgrade Now';
  static const String paymentMethod = "Payment Method";
  static const String paymentMethodHint = "MasterCard 13345***44";
  static const String payWithApplePayAndGetOffers =
      "Pay with Apple pay and get offers and discount in your next purchase";
  static const String pay = "Pay";
  static const String payNow = "Pay now";

  ///====================== Home ========================
  static const String yourGroceryExpensesAtAGlance =
      "Your grocery expenses at a glance";

  static const String add = "Add";
  static const String purchaseHistory = "Purchase History";
  static const String itemsYouveBought = "Items you've bought";
  static const String viewAll = "View All";

  ///====================== Scanner ========================
  static const String scanner = "Scanner";

  static const String recentScans = "Recent Scans";
  static const String edit = "Edit";
  static const String save = "Save";
  static const String processed = "Processed";

  ///====================== Transaction History ========================
  static const String transactionHistory = "Transaction History";
  static const String totalSpending = "Total Spending";
  static const String export = "Export";
  static const String download = "Download";

  ///====================== Profile ========================
  static const String profile = "Profile";
  static const String unlockExclusiveFeatures =
      "Unlock exclusive features and supercharge your dating experience.";
  // static const String upgradeFrom = "Upgrade from \$9.99";
  static const String manager = "Manager";
  static const String addedReceipt = "Added Receipt";
  static const String recently = "Recently";
  static const String total = "Total";

  ///====================== Report ========================
  static const String report = "Report";
  static const cancel = 'cancel';
  static const takeFirstStep =
      'Go Premium for unlimited calls, exclusive ringtones, and customizable call times. Upgrade now!';
  static const monthlyPremiumPlan = 'monthly_premium_plan';
  static const yearlyPremiumPlan = 'yearly_premium_plan';
  static const moreScan = 'more_scan';
  static const unlockMonthlyReport = 'unlock_monthly_report';
  static const unlimitedScan = 'unlimited_scan';
  static const unlockYearlyReport = 'unlock_yearly_report';
  static const pricingInfo = 'pricing_info';
  static const freeTrialFor = 'Free Trial For';
  static const sevenDays = '7days';
  static const String fifteenSec = "15 sec";
  static const String thirtySec = "30 sec";
  static const String oneMin = "1 min";
  static const String custom = "Custom";
  static const String startCall = "Start Call";
  static const String caller = "Caller";
  static const String mom = "MOM";
  static const String dad = "Dad";
  static const String love = "Love";
  static const String setUpFakeCall = "Set up fake call";
  static const String setCustomTime = "Set Custom Time";
  static const String minutes = "Minutes";
  static const String seconds = "Seconds";
  static const String selected = "Selected";
  static const String setTime = "Set Time";
  static const String pleaseSelectCallerAndTime =
      "Please select both caller and call time";
  static const String pleaseSetValidTime = "Please set a valid time";
  static const String fakeCallWillStartIn = "Fake call will start in";
  static const String search = "Search";
  static const String bestFriend = "Best Friend";
  static const String momWorriedMessage =
      "Mom is really worried about you and wants you home immediately";
  static const String bestFriendMessage =
      "Hey bestfriend let me tell you about my day";
  static const String dadMessage =
      "Hey, how was your day? Dad is waiting for your response";
  static const String loveMessage =
      "Hey babe, when do you get home? While I have you on the phone......";
  static const String settings = "Settings";
  static const String chooseYourIconColor = "Choose your icon color";
  static const String chooseYourLanguage = "Choose your language";
  static const String english = "English";
  static const String spanish = "Spanish";
  static const String ringtone = "Ringtone";
  static const String defaultRingtone = "Default";
  static const String quad = "Quad";
  static const String radial = "Radial";
  static const String resetToDefault = "Reset to Default";
  static const String saveChanges = "Save Changes";
  static const String changesSaved = "Changes saved!";
  static const String light = "Light";
  static const String dashboard = "Dashboard";
  static const String totalSubscribers = "Total Subscribers";
  static const String manageUsers = "Manage Users";
  static const String appSettings = "App Settings";
  static const String monthlyUserGrowth = "Monthly User Growth";
  static const String jan = "Jan";
  static const String feb = "Feb";
  static const String mar = "Mar";
  static const String apr = "Apr";
  static const String may = "May";
  static const String jun = "Jun";
  static const String userManagement = "User Management";
  static const String searchUsers = "Search users...";
  static const String subscriber = "Subscriber";
  static const String adminEmail = "admin@example.com";
  static const String profileAndAccount = "Profile & Account";
  static const String updateProfile = "Update Profile";
  static const String changePassword = "Change Password";
  static const String appPreference = "App Preference";
  static const String appConfigurations = "App Configurations";
  static const String logout = "Logout";
  static const String camera = "Camera";
  static const String upload = "Upload";
  static const String tapCameraToUpload = "Tap the camera icon to upload";

  static const String notifications = "Notifications";
  static const String controlNotifications =
      "Control how and when you receive notifications.";
  static const String pushNotifications = "Push Notifications";
  static const String receivePushNotifications =
      "Receive alerts and updates via\n push notifications.";
  static const String calling = "Calling";
  static const String remindMe = "Remind me";
  static const String message = "Message";
  static const String decline = "Decline";
  static const String accept = "Accept";
  static const String mute = "Mute";
  static const String keyboard = "Keyboard";
  static const String speaker = "Speaker";
  static const String sound = "Sound";
  static const String addCall = "Add call";
  static const String video = "Video";
  static const String callers = "Callers";

  static const String newContact = "New Contact";
  static const String done = "Done";
  static const String addPhoto = "Add Photo";
  static const String firstName = "First name";
  static const String lastName = "Last name";
  static const String phoneNumber = "Phone number";

  static const String addVoice = "Add voice";
  static const String addTheme = "Add theme";
  static const String saveContact = "Save Contact";

  static const String forCustom = "For Custom";
  static const String pricePerYear = "\$9.99";

  static const String fullLibrary = "Full library of voices and themes";
  static const String customCaller = "Custom caller name and contact image";

  // static const String subscriptionNote =
  //     "You will be charged \$9.99 (annual plan) through your iTunes account. You can cancel at any time if you're not satisfied.";
  static const String subscriptionNote =
      "You will be charged \$1.99 per month (monthly plan) or \$9.99 per year (annual plan) saving 60% with the yearly plan—just \$0.83/month—through your paypal account. You can cancel at any time if you're not satisfied.";

  static const String passwordResetLinkSent =
      "Password reset link sent to your email";
  static const String failedToSendResetLink =
      "Failed to send reset link. Please try again.";
  static const String sending = "Sending...";

  static const String gallery = "Gallery";
  static const String selectImageSource = "Select Image Source";
  static const String profilePictureUpdated =
      "Profile picture updated successfully";
  static const String failedToPickImage =
      "Failed to pick image. Please try again.";
  static const String profileUpdatedSuccessfully =
      "Profile updated successfully";
  static const String failedToUpdateProfile =
      "Failed to update profile. Please try again.";
  static const String currentPasswordRequired = "Current password is required";
  static const String newPasswordRequired = "New password is required";
  static const String newPasswordMustBeDifferent =
      "New password must be different from current password";
  static const String passwordChangedSuccessfully =
      "Password changed successfully";
  static const String failedToChangePassword =
      "Failed to change password. Please try again.";
  static const String updating = "Updating...";
  static const String changing = "Changing...";
// static const String newContact = "New Contact";
//   static const String cancel = "Cancel";
//   static const String done = "Done";
//   static const String addPhoto = "Add Photo";
//   static const String firstName = "First Name";
//   static const String lastName = "Last Name";
//   static const String phoneNumber = "Phone Number";
//   static const String message = "Message";
//   static const String addVoice = "Add Voice";
//   static const String addTheme = "Add Theme";
//   static const String saveContact = "Save Contact";

  // Validation strings
  static const String firstNameRequired = "First name is required";
  static const String firstNameMinLength =
      "First name must be at least 2 characters";
  static const String lastNameRequired = "Last name is required";
  static const String lastNameMinLength =
      "Last name must be at least 2 characters";
  static const String phoneNumberRequired = "Phone number is required";
  static const String invalidPhoneNumber = "Please enter a valid phone number";
  static const String messageRequired = "Message is required";
  static const String messageMinLength =
      "Message must be at least 10 characters";

  // Success/Error messages
  static const String profileImageSelected =
      "Profile image selected successfully";
  static const String voiceFileSelected = "Voice file selected successfully";
  static const String failedToPickVoiceFile =
      "Failed to pick voice file. Please try again.";
  static const String contactSavedSuccessfully = "Contact saved successfully";
  static const String failedToSaveContact =
      "Failed to save contact. Please try again.";
  static const String contactUpdatedSuccessfully =
      "Contact updated successfully";
  static const String failedToUpdateContact =
      "Failed to update contact. Please try again.";
  static const String contactDeletedSuccessfully =
      "Contact deleted successfully";
  static const String failedToDeleteContact =
      "Failed to delete contact. Please try again.";
  static const String editContact = "Edit Contact";
  static const String updateContact = "Update Contact";
  static const String saving = "Saving...";
  static const String contacts = "contacts";
  static const String saved = "saved";
  static const String noContactsYet = "No contacts yet";
  static const String noResultsFound = "No results found";
  static const String addFirstContact = "Add your first contact";
  static const String delete = "Delete";
  static const String deleteContact = "Delete Contact";
  static const String deleteContactConfirmation =
      "Are you sure you want to delete {name}?";
  static const String close = "Close";
  static const String call = "Call";
  static const String contactListUpdated = "Contact list updated";
  static const String contactAddedSuccessfully = "Contact added successfully";
  static const String failedToOpenNewContactScreen =
      "Failed to open new contact screen";
  static const String failedToOpenEditScreen = "Failed to open edit screen";
  static const String searchCleared = "Search cleared";
  static const String showingAllContacts = "Showing all contacts";
  static const String noResults = "No results";
  static const String tryDifferentSearchTerm = "Try a different search term";
  static const String details = "Details";
  static const String share = "Share";
  static const String createContact = "Create Contact";
  static const String sharing = "Sharing";
  static const String contactCreatedFromTemplate =
      "Contact created from template";
  static const String failedToCreateContact = "Failed to create contact";
  static const String templateEditedAndSaved =
      "Template edited and saved as contact";
  static const String failedToEditTemplate = "Failed to edit template";
  static const String deleteTemplate = "Delete Template";
  static const String deleteTemplateConfirmation =
      "Are you sure you want to delete the {name} template?";
  static const String cannotDeleteDefaultTemplate =
      "Cannot delete default templates";
  static const String contactDuplicated = "Contact duplicated successfully";
  static const String failedToDuplicateContact = "Failed to duplicate contact";
  static const String refreshToken = "refreshToken";
}
