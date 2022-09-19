import 'package:flutter/material.dart';

class RecordDetailModal extends StatelessWidget {
  const RecordDetailModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          _RecordDetailCard(),
          _RecordDetailMiddlePart(),
          SizedBox(
            height: 20,
          ),
          _RecordDetailBottomPart(),
        ],
      ),
    );
  }
}

class _RecordDetailBottomPart extends StatelessWidget {
  const _RecordDetailBottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Jogger"),
                SizedBox(
                  height: 4,
                ),
                Image.asset(
                  'images/3.png',
                  width: 120,
                ),
                SizedBox(
                  height: 4,
                ),
                Text("#123456789"),
                SizedBox(
                  height: 4,
                ),
                Text("96/100"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.currency_bitcoin,
                      size: 20,
                      color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "+5.36",
                      style: textStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.electric_bolt,
                      size: 20,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "-1.6",
                      style: textStyle,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _RecordDetailMiddlePart extends StatelessWidget {
  const _RecordDetailMiddlePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _CustomTextWithLabel(),
        _CustomTextWithLabel(),
      ],
    );
  }
}

class _CustomTextWithLabel extends StatelessWidget {
  const _CustomTextWithLabel({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
    return Container(
      child: Column(
        children: [
          Text(
            "00:11:19",
            style: textStyle,
          ),
          Text(
            "Time",
            style: textStyle.copyWith(
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecordDetailCard extends StatelessWidget {
  const _RecordDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     width: 1.0,
      //     color: Colors.black,
      //   ),
      //   borderRadius: BorderRadius.circular(6.0),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CustomAvatar(),
              const SizedBox(
                width: 16.0,
              ),
              _Content(),
              const SizedBox(
                width: 16.0,
              ),
              _MeterInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomAvatar extends StatelessWidget {
  const _CustomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: CircleAvatar(
        radius: 16.0,
        backgroundColor: Colors.white70,
        child: Icon(Icons.account_circle, size: 50.0),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Seungyong"),
          Text("12/04/2022 9:202"),
        ],
      ),
    );
  }
}

class _MeterInfo extends StatelessWidget {
  const _MeterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("0.54"),
        Text("Km"),
      ],
    );
  }
}
