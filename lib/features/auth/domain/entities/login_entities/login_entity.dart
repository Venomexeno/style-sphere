import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String accessTokenEntity;
  final String refreshTokenEntity;

  const LoginEntity({
    required this.accessTokenEntity,
    required this.refreshTokenEntity,
  });

  @override
  List<Object?> get props => [
        accessTokenEntity,
        refreshTokenEntity,
      ];
}
