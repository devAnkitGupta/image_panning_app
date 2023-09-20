class ErrorResponse {
  ErrorResponse({
    required this.success,
    required this.isAuth,
    required this.errorCode,
    required this.message,
    required this.result,
  });
  late final bool success;
  late final bool isAuth;
  late final int errorCode;
  late final String message;
  late final List<dynamic> result;
  
  ErrorResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    isAuth = json['isAuth'];
    errorCode = json['errorCode'];
    message = json['message'];
    result = List.castFrom<dynamic, dynamic>(json['result']);
  }
}