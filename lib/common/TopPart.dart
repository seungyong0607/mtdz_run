import 'package:flutter/material.dart';
import 'package:mtdz_run/common/CustomCircleAvatar.dart';
import 'package:mtdz_run/controller/UserController.dart';
import 'package:get/get.dart';

class TopPart extends StatefulWidget {
  const TopPart({
    Key? key,
  }) : super(key: key);

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetX<Controller>(
          builder: (_) => CustomCircleAvatar(
            mater: controller.user().mater.toDouble(),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
            boxShadow: const [
              BoxShadow(
                // color: Colors.grey[500],
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-2.0, -2.0),
                blurRadius: 4.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.currency_bitcoin,
                    color: Colors.black,
                  ),
                ),
                GetX<Controller>(
                  builder: (_) => _CustomText(
                    text: '${controller.user().coin}',
                  ),
                ),
                const SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.home_repair_service,
                    color: Colors.black,
                  ),
                ),
                GetX<Controller>(
                  builder: (_) => _CustomText(
                    text: '${controller.user().box}',
                  ),
                ),
                const SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.key_outlined,
                    color: Colors.black,
                  ),
                ),
                GetX<Controller>(
                  builder: (_) => _CustomText(
                    text: '${controller.user().key}',
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _CustomText extends StatelessWidget {
  final String text;
  const _CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
