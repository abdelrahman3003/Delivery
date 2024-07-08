import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/services/services.dart';
import 'delivery.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inialServices();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Delivery());
}
