class HTTPResponseValidator {
  static bool isValidStatusCode(int statusCode) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else {
      throw HTTPExeption(statusCode: statusCode);
    }
  }
}

class HTTPExeption implements Exception {
  final int statusCode;

  HTTPExeption({required this.statusCode});

  @override
  String toString() {
    String message;
    switch (statusCode) {
      case 400:
        message = "Bad Request";
        break;
      case 401:
        message = "UnAuthorized";
        break;
      case 403:
        message = "Forbiden";
        break;
      case 409:
        message = "conflict";
        break;
      case 500:
        message = "Intenal Server Error";
        break;
      default:
        message = "UnKnown Error";
    }
    return "MY Http Exeption: statusCode:$statusCode messeage:$message";
  }
}
