import 'package:equatable/equatable.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';

class ErrorResponse extends Equatable {
  const ErrorResponse({this.type, this.message, this.errorMessages});

  factory ErrorResponse.fromMap(DataMap map) {
    var errorMessages =
        (map['errors'] as List?)
            ?.cast<DataMap>()
            .map((error) => error['message'] as String)
            .toList();
    if (errorMessages != null && errorMessages.isEmpty) errorMessages = null;
    return ErrorResponse(
      type: map['type'],
      message: map['message'],
      errorMessages: errorMessages,
    );
  }

  final String? type;
  final String? message;
  final List<String>? errorMessages;

  String get errorMessage {
    var payload = '';
    if (type != null) payload = '${type!}\n';
    if (message != null) {
      payload += message!;
    } else {
      if (errorMessages != null) {
        for (final (index, message) in errorMessages!.indexed) {
          if (index == 0) {
            payload += '\n$message';
          } else {
            payload += '\n\n$message';
          }
        }
      }
    }
    return payload;
  }

  @override
  List<Object?> get props => [type, message];
}
