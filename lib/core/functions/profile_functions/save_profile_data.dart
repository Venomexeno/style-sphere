import 'package:ecommerce/features/profile/domain/entities/profile_entity.dart';
import 'package:hive/hive.dart';

void saveProfileData(ProfileEntity profile, String boxName) {
  var box = Hive.box<ProfileEntity>(boxName);
  box.add(profile);
}
