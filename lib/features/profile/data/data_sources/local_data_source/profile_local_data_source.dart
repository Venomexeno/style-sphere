import 'package:ecommerce/core/constants/app_constants.dart';
import 'package:ecommerce/features/profile/domain/entities/profile_entity.dart';
import 'package:hive/hive.dart';

abstract class ProfileLocalDataSource {
  ProfileEntity fetchProfile();
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  @override
  ProfileEntity fetchProfile() {
    var box = Hive.box<ProfileEntity>(kProfile);

    return box.values.single;
  }
}
