import 'package:advance_image_picker/models/image_object.dart';
import 'package:advance_image_picker/widgets/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/src/ui/dialog/progress.dart';

class CommonUtils {
  List<String> _imgObjs = [];

  openMultiImagePicker(BuildContext context, int maxCount) async {
    List<ImageObject> objects = await Navigator.of(context)
        .push(PageRouteBuilder(pageBuilder: (context, animation, __) {
      return ImagePicker(
        maxCount: maxCount,
      );
    }));

    if (objects.length > 0) {
      _imgObjs.addAll(objects.map((e) => e.modifiedPath).toList());
    }

    return _imgObjs;
  }

  static showProgress(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Progress();
      },
      useRootNavigator: false,
    );
  }

  static showProgressAutoCancel(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2)).then((_) {
          Navigator.pop(context);
        });
        return Progress();
      },
      useRootNavigator: false,
    );
  }

  static hideProgress(BuildContext context) {
    Navigator.pop(context, false);
  }
}
