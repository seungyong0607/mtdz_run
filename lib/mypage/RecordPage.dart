import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mtdz_run/database/drift_database.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Record Page"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          _RecordDetailInfo(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12),
              child: FutureBuilder<List<Record>>(
                  future: GetIt.I<LocalDatabase>().getRecord(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasData && snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("There is no record."),
                      );
                    }

                    return ListView.separated(
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 2.0,
                        );
                      },
                      itemBuilder: (context, index) {
                        DateTime startTime = DateTime.parse(
                            snapshot.data![index].startTime.toString());

                        String startDateTime =
                            "${startTime.month}/${startTime.day}/${startTime.year} ${startTime.hour}:${startTime.second}";

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/recordDetailPage',
                              arguments: snapshot.data![index].id,
                            );
                          },
                          child: SizedBox(
                            child: _RecordCard(
                              activeTime: DateTime.now(),
                              startDateTime: startDateTime,
                              meter: 3,
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class _RecordCard extends StatelessWidget {
  final String startDateTime;
  final DateTime activeTime;
  final double meter;

  const _RecordCard({
    super.key,
    required this.startDateTime,
    required this.activeTime,
    required this.meter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: FutureBuilder<List<Record>>(
          future: GetIt.I<LocalDatabase>().getRecord(),
          builder: (context, snapshot) {
            final list = snapshot.data;

            int metar = 0;
            int items = 0;
            double times = 0.0;

            // list!.forEach((element, index) {
            //   print(element, index);
            // });

            return Column(
              children: [
                Row(
                  children: [
                    Text("$startDateTime"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.map, size: 60),
                    Expanded(child: Text("00:01:20 $meter km")),
                    Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
              ],
            );
          }),
    );
  }
}

class _RecordDetailInfo extends StatelessWidget {
  // final List<Record> record;
  const _RecordDetailInfo({
    super.key,
    // required this.record,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.blue, width: 0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MeterInfo(),
          _Insignia(),
        ],
      ),
    );
  }
}

class _Insignia extends StatelessWidget {
  const _Insignia({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print(" button click ");
      },
      color: Colors.white,
      iconSize: 50,
      icon: const Icon(Icons.workspace_premium_sharp),
    );
  }
}

class _MeterInfo extends StatelessWidget {
  const _MeterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomText(
          label: "Total km",
          content: "23 km",
        ),
        _CustomText(
          label: "Total Runs",
          content: "3 Itmes",
        ),
        _CustomText(
          label: "Total Time",
          content: "0.2 hours",
        )
      ],
    );
  }
}

class _CustomText extends StatelessWidget {
  final String label;
  final String content;

  const _CustomText({
    super.key,
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 16.0,
    );

    return Column(
      children: [
        Text(
          content,
          style: textStyle,
        ),
        Text(
          label,
          style: textStyle.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
