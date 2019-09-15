

class Endpoints {
  // Firebase
  static const String _firebaseKey = 'AIzaSyD-UdtmvHvgakripTKCoTwvCH-Q1RYvMF4';
  static const String firebaseUrl = 'https://flutter-general.firebaseio.com';
  static const String firebaseSignIn = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseKey';
  static const String firebaseSignUp = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseKey';
  // Cloudinary
  static const String cloudinaryUploadUrl = 'https://api.cloudinary.com/v1_1/dgtsbgju3/image/upload?upload_preset=tp0kckw7';
}