import 'package:prakhya_ecomly/core/utils/typedefs.dart';

abstract class UseCaseWithParams<Type, Params>{
  const UseCaseWithParams();

  FutureResult<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type>{
  const UseCaseWithoutParams();

  FutureResult<Type> call();
}