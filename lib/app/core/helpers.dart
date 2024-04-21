import 'dart:io';

class Helpers {
  getLocationCountryCode() {
    return RegExp(r'(?<=_)[A-Z]{2}').stringMatch(Platform.localeName);
  }
}
