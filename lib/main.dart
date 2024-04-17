import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/app.dart';
import 'src/core/local/key_value_storage_base.dart';
import 'src/utils/path_provider_service.dart';

late final TextStyle montserratBold;
late final TextStyle? montserratSmall;
void initTextStyle() {
  montserratBold = GoogleFonts.montserrat(
      textStyle: const TextStyle(fontWeight: FontWeight.bold));
  montserratSmall = GoogleFonts.montserrat(
      textStyle: const TextStyle(fontWeight: FontWeight.w200, fontSize: 12.0));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  initTextStyle();
  await PathProviderService.init();
  await KeyValueStorageBase.init();
  runApp(const MyApp());
}
