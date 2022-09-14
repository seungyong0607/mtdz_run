import 'package:get/get.dart';
import 'package:mtdz_run/model/User.dart';

class Controller extends GetxController {
  final user = User().obs; // returns rxstate

  void updateInfo({required coin, required subtractKey, required subtractBox}) {
    coin = user().coin + coin;
    subtractKey = user().key - subtractKey;
    subtractBox = user().box - subtractBox;
    user.update((val) {
      val?.coin = coin;
      val?.key = subtractKey;
      val?.box = subtractBox;
    });
  }

  void boxCountUpdate() {
    user.update((val) {
      val?.box++;
    });
  }

  void keyCountUpdate() {
    user.update((val) {
      val?.key++;
    });
  }

  void meterUpdate(meter) {
    meter = user().mater + meter;
    meter = double.parse(meter.toStringAsFixed(1));
    user.update((val) {
      val?.mater = meter;
    });
  }
}
