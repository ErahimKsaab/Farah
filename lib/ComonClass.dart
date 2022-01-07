import 'package:connectivity/connectivity.dart';

class usedd{
  Future<bool> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
// print('Mobile');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
// print('Wifi');
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      print('No Connection');
      return false;
    } else {
      return false;
    }
  }

  bool checkEmailFormat(String email) {
    bool emailFormat;
    if (email != '') {
      emailFormat = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    }
    return emailFormat;
  }
}