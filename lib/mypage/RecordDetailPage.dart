import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:mtdz_run/database/drift_database.dart';
import 'package:mtdz_run/mypage/RecordModal.dart';

class RecordDetailPage extends StatefulWidget {
  const RecordDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecordDetailPage> createState() => _RecordDetailPageState();
}

class _RecordDetailPageState extends State<RecordDetailPage> {
  late Future<List<Polyline>> polylines;

  // Future<List<Polyline>> getPolylines() async {
  //   final data = await GetIt.I<LocalDatabase>().getMovementsById(widget.id);

  //   final test = data[0].lat;
  //   final test2 = data[0].long;
  //   print("test $test $test2");
  //   final polyLines = [
  //     Polyline(
  //       points: [
  //         LatLng(double.parse(test), double.parse(test2)),
  //         LatLng(double.parse(test), double.parse(test2)),
  //         LatLng(double.parse(test), double.parse(test2)),
  //       ],
  //       strokeWidth: 4,
  //       color: Colors.amber,
  //     ),
  //   ];
  //   // await Future<void>.delayed(const Duration(seconds: 1));
  //   return polyLines;
  // }

  List<Polyline> getPolylines(datas) {
    List<LatLng> points = <LatLng>[];

    datas.forEach((e) {
      final test1 = double.parse(e.lat);
      final test2 = double.parse(e.long);

      points.add(LatLng(test1, test2));
    });

    final polyLines = [
      Polyline(
        points: points,
        strokeWidth: 4,
        gradientColors: [
          const Color(0xffE40203),
          const Color(0xffFEED00),
          const Color(0xff007E2D),
        ],
      ),
    ];

    return polyLines;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final id = int.parse(args.toString());

    // final points = <LatLng>[
    //   LatLng(37.5270425, 126.9667016),
    //   LatLng(36.5270425, 127.9667016),
    //   LatLng(35.5270425, 128.9667016),
    // ];

    // final pointsGradient = <LatLng>[
    //   LatLng(37.5270425, 126.9667016),
    //   LatLng(36.5270425, 126.9667016),
    //   LatLng(35.5270425, 126.9667016),
    // ];

    return Scaffold(
      appBar: AppBar(
        // title: Text("d"),
        // centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.share),
            tooltip: 'Sns',
            onPressed: () => {
              _showdialog(context),
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
          child: FutureBuilder<List>(
            future: GetIt.I<LocalDatabase>().getMovementsById(id),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              debugPrint('snapshot: ${snapshot.hasData}');
              if (snapshot.hasData) {
                final data = snapshot.data![0];
                return Column(
                  children: [
                    Flexible(
                      child: FlutterMap(
                        options: MapOptions(
                          center: LatLng(
                            double.parse(data.lat),
                            double.parse(data.long),
                          ),
                          zoom: 15,
                          onTap: (tapPosition, point) {
                            setState(() {
                              debugPrint('onTap');
                              // polylines = getPolylines();
                            });
                          },
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName:
                                'dev.fleaflet.flutter_map.example',
                          ),
                          // PolylineLayer(
                          //   polylines: [
                          //     Polyline(
                          //         points: points,
                          //         strokeWidth: 4,
                          //         color: Colors.purple),
                          //   ],
                          // ),
                          // PolylineLayer(
                          //   polylines: [
                          //     Polyline(
                          //       points: pointsGradient,
                          //       strokeWidth: 4,
                          //       gradientColors: [
                          //         const Color(0xffE40203),
                          //         const Color(0xffFEED00),
                          //         const Color(0xff007E2D),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          PolylineLayer(
                            polylines: getPolylines(snapshot.data),
                            polylineCulling: true,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true, // 이게 있어야 위로 밀림
                                builder: (_) {
                                  return RecordDetailModal();
                                },
                              );
                            },
                            child: Text("detail"),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showdialogSns(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          title: const Center(
            child: Text('sns 공유'),
          ),
          content: Container(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("인스타"), // 추후
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("트위터"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("페북"),
                )
              ],
            ),
          )
          // actions: [
          //   ElevatedButton(
          //       onPressed: () => Navigator.of(context).pop(),
          //       child: const Text('10회 뽑기')),
          //   ElevatedButton(
          //       onPressed: () => Navigator.of(context).pop(),
          //       child: const Text('취소')),
          // ],
          ),
    );
  }

  Future<dynamic> _showdialog(BuildContext context) {
    Future<PickedFile?> _takePicture() async {
      final picker = await ImagePicker();
      final imageFile = await picker.pickImage(
          source: ImageSource.camera, maxHeight: 600, maxWidth: 600);
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          title: const Center(
            child: Text('sns 공유'),
          ),
          content: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showdialogSns(context);
                  },
                  child: Text("지도 경로"), // 추후
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _takePicture();
                  },
                  child: Text("사진 촬영"), // 카메라 연결
                )
              ],
            ),
          )
          // actions: [
          //   ElevatedButton(
          //       onPressed: () => Navigator.of(context).pop(),
          //       child: const Text('10회 뽑기')),
          //   ElevatedButton(
          //       onPressed: () => Navigator.of(context).pop(),
          //       child: const Text('취소')),
          // ],
          ),
    );
  }
}
