import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'firebase/firebase_options_dev.dart';
import 'src/core/flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  AppFlavour.appFlavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await runner.main();
}
