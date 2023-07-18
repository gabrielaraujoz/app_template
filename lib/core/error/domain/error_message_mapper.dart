import 'package:app_template/core/error/domain/app_error.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ErrorMessageMapper {
  ErrorMessageMapper();

  String getMessage(dynamic error) {
    String message;
    const genericErrorMessage =
        'Ooops, something bad happened, please try again';
    const networkErrorMessage =
        'Ooops, something bad happened, please check your internet connection and try again';

    if (error is AppError) {
      if (error.isNetworkError) {
        message = networkErrorMessage;
      } else {
        message =
            error.message.isNotEmpty ? error.message : genericErrorMessage;
      }
    } else {
      message = genericErrorMessage;
    }
    return message;
  }
}
