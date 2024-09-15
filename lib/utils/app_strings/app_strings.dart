class AppStrings {

  static RegExp passRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.{8,}$)');
  static RegExp urlRegex = RegExp( r'^(http|https):\/\/[a-zA-Z0-9-\.]+\.[a-z]{2,4}(/\S*)?$');
  static RegExp emailRegexp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String fieldCantBeEmpty = "Field can't be empty";
  static const String passDoesNotMatch = "Password does not match";
  static const String passwordMustHaveEightWith = "Password must have 8 characters With(A-z,a-z,0-9)";
  static const String enterValidEmail = "Enter a valid email";
  static const String passMustContainBoth = "Password must be 8 characters long & must include one capital letter";
  static const String enterAValidName = "Enter a valid name";
  static const String enterValidEamil = "Please Enter Your Email Address";

  ///===========================Splash screen====================
  static const discover="Discover Beauty with NIFI";


  ///=========================Auth strings===============
static const welcome = 'Welcome,';
static const user = ' User';
static const homeWelcome = 'Welcome';
static const loginTOStartWith = 'login to start with';
static const email = 'Email';
static const submit = 'Submit';
static const password = 'Password';
static const newPassword = 'New Password';
static const forgotPassword = 'Forgot Password?';
static const emailConfirmation = 'Email Confirmation';
static const signIn = 'SIGN IN';
static const enterYourReview = 'Enter your review:';
static const enterYourEmailForVerification = 'Enter your email for verification';
static const dontHaveAnAccount = 'Don’t have an account?';
static const register = 'REGISTER';
static const yourOverallRatingOfThis = 'Your overall rating of this product';
static const rememberPassword = 'Remember password?';
static const chosseYourSignUPOption = 'Choose your sign up option';
static const signUpAsAUser = 'Sign Up as a User';
static const registerAsASalon = 'Register as a Salon';
static const registecrerAsASalon = 'Create your User account';
static const name = 'Name';
static const confirmPassword = 'Confirm password';
static const iUnderstoodThe = 'I understood the';
static const termsAndPolicy = 'terms & policy';
static const signUp = 'SIGN UP';
static const haveAnAccount = 'Have an account? ';
static const enterTheCode = 'Enter the code';
static const code = 'Code';
static const setANewPassword = 'Set a new password';
static const continues = 'Continue';
static const updatePassword = 'Update Password';
static const sendVerificationCode = 'Send Verification Code';
static const createYourUserAccount = 'Create your account';
static const wehaveSentYou = 'We’ve sent you a verification code to your email.';

///=========================Owner section====================
static const registerYouSalon = 'Register Your Salon';

///===============profile section ========================
static const profile = 'Profile';
static const fullName = 'Full Name';
static const phoneNumber = 'Phone Number';
static const address = 'Address';
static const gender = 'Gender';
static const editProfile = 'Edit Profile';

///===========================<menu section======================
  static const menu = 'Menu';
  static const myAccount = 'My Account';
  static const mySalon = 'My Salon';
  static const myProfile = 'My Profile';
  static const settings = 'Settings';
  static const termsAndCondition = 'Terms & Condition';
  static const aboutUs = 'About Us';
  static const privacyPolicy = 'Privacy policy';
  static const logOut = 'Log Out';
  static const changePassword = 'Change Password';
  static const deleteAccount = 'Delete Account';
  static const oldPassword = 'Old Password';
  static const delete = 'Delete';
  static const saveChanges = 'Save Changes';
  static const cancel = 'Cancel';
  static const wantToDeleteAccount = 'Want to delete account?';
  static const pleaseInputYourPassword = 'Please input your password to remove your account.';


  ///================================Home screen=======================

  static const notification = 'Notification';
  static const myBookmark = 'My Bookmark';
  static const readAll = 'Read all';
  static const searchHere = 'Search here...';
  static const categories = 'Categories';
  static const category = 'Category';
  static const viewAll = 'View All';
  static const manicures = 'Manicures';
  static const all = 'All';
  static const nailArt = 'Nail Art';
  static const female = 'Female';
  static const male = 'Male';
  static const specialty  = 'Specialty ';
  static const treatments  = 'Treatments ';
  static const kid = 'Kid';
  static const applyFilter = 'Apply Filter';
  static const pedicures = 'Pedicures';
  static const rating = 'Rating';
  static const searchNearbyYourLocation = 'Search nearby your location';
  static const seeDetails = 'See Details';
  static const filter = 'Filter';
  static const resultFound = 'Result found';
  static const featuredSalons = 'Featured Salons';
  static const whatIsYourLocation = 'What is Your Location';
  static const giveYourLocationPermission = 'Give your location permission';
  static const weNeedToKnowYourLocation = 'we need to know your location in order to suggest nearby services.';
  static const myBalance = 'My Balance';
  static const lastBookDate = 'Last Booked Date';
  static const totalAmount = 'Total';
  static const totalClients = 'Total Clients';
  static const weeklyTotalIncome = 'Weekly Total Income';
  static const weeklyTotalClient = 'Weekly Clients';
  static const weeklyRepeatClient = 'Weekly Repeat Clients';
  static const weeklyNewClient = 'Weekly New Clients';


  ///=============================My Appointment==================================
static const myAppointment = 'My Appointment';
static const upcoming = 'Upcoming';
static const completed = 'Completed';
static const reschedule = 'Reschedule';
static const complete = 'Complete';
static const viewEReceipt = 'View E-Receipt';

///=================================E_Receipt =========================
static const eReceipt = 'E-Receipt';
static const orderNo = 'Order No:';
static const phone = 'Phone:';
static const salon = 'Salon';
static const bookingDate = 'Booking Date:';
static const bookingHours = 'Booking Hours:';
static const classicPedicure = 'Classic Pedicure';
static const addGelPolish = 'Add Gel Polish';
static const extraMassage = 'Extra Massage';
static const total = 'Total';
static const backToHome = 'Back to Home';


///==========================Book Appointment===========================
static const bookAppointment = 'Book Appointment';
static const selectDate = 'Select Date';
static const selectHours = 'Select Hours';


///=========================Salon details======================
static const openingHours = 'Opening Hours';
static const services = 'Services';
static const about = 'About';
static const gallery = 'Gallery';
static const reviews = 'Reviews';
static const addReview = 'add review';
static const signaturePedicure = 'Signature Pedicure';
static const vipPedicure = 'VIP Pedicure';
static const writeYourReviewHere = 'Write your review here';


///==================================Salon =====================
  static const bookings = 'Bookings';
  static const salonProfile = 'Salon Profile';
  static const addProfilePhoto = 'Add Profile Photo';
  static const addGalleryPhotos = 'Add Gallery Photos';
  static const salonName = 'Salon Name';
  static const salonAddress = 'Salon Address';
  static const salonAbout = 'Salon About';
  static const update = 'Update';
  static const photos = 'Photos';
  static const uploadPhotos = 'Upload Photos';
  static const salonService = 'Salon Service';
  static const addService = 'Add Service';

  ///==============================Inventory==========================
static const inventory = 'Inventory';
static const addInventory = 'Add Inventory';
static const products = 'Products';
static const outOfStock = 'Out of Stock';
static const expire = 'Expire';
static const productId = 'Product ID:';
static const productQty = 'Product QTY:';
static const expirationDate = 'Expiration Date:';
static const quantity = 'Quantity';
static const addProduct = 'Add Product';
static const updateQuantity = 'Update Quantity';
static const productName = 'Product Name';
static const updateProduct = 'Update Product';

}
