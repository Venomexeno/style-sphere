import 'package:ecommerce/features/auth/domain/entities/sign_up_entities/check_email_entity.dart';

class CheckEmailModel extends CheckEmailEntity {
  final bool? isAvailable;

  CheckEmailModel({this.isAvailable}) : super(isAvailableEntity: isAvailable!);

  factory CheckEmailModel.fromJson(Map<String, dynamic> json) =>
      CheckEmailModel(
        isAvailable: json["isAvailable"],
      );
}
