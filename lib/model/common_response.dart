class CommonResponse {
  bool? status;
  String? message;
  String? errors;
  String? error;
  int? statusCode;
  dynamic data;

  CommonResponse({
    this.status,
    this.message,
    this.errors,
    this.error,
    this.statusCode,
    this.data,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) =>
      CommonResponse(
        status: json['status'],
        message: json['message'],
        errors: json['errors'],
        error: json['error'],
        statusCode: json['status_code'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() =>
      {
        'status': status,
        'message': message,
        'errors': errors,
        'error': error,
        'status_code': statusCode,
        'data': data,
      };

  @override
  String toString() {
    return 'CommonResponse{status: $status, message: $message, errors: $errors, status_code: $statusCode, data: $data}';
  }
}
