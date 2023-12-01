import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:ecommerce/features/settings/presentation/widgets/settings_page_body.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    required this.userEntity,
  });

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsPageBody(
        id: userEntity.idEntity,
        name: userEntity.nameEntity,
        imageUrl: userEntity.avatarEntity,
        email: userEntity.emailEntity,
      ),
    );
  }
}
