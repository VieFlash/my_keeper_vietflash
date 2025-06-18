import 'dart:ui';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class NoteBookController extends GetxController {
  var offsetEventDetail = const Offset(250, 400).obs;
  var isDragPreviewButton = false.obs;
  var isOnLeft = false.obs;

}
