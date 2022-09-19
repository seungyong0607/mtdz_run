import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyPage"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          _MyPageTopPart(),
          _MenuArea(
            list: [
              _recordPart(),
              _SoundSwitch(),
              _VibrationSwitch(),
              _VersionInfo(),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _Logout(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _recordPart extends StatelessWidget {
  const _recordPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/recordPage');
      },
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Record"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("23k"),
                const Icon(Icons.navigate_next),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Logout extends StatelessWidget {
  const _Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            child: Text("회원탈퇴"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              print("회원탈퇴");
            },
          ),
        ),
      ],
    );
  }
}

class _VersionInfo extends StatelessWidget {
  const _VersionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Version"),
          SizedBox(
            width: 46,
            child: Text("0.7.5"),
          ),
        ],
      ),
    );
  }
}

class _MenuArea extends StatelessWidget {
  final List<Widget> list;
  const _MenuArea({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 10,
      ),
      child: Column(
        children: list,
      ),
    );
  }
}

class _MyPageTopPart extends StatelessWidget {
  const _MyPageTopPart({super.key});

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
      height: 60,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 16.0,
              backgroundColor: Colors.white70,
              child: Icon(
                Icons.account_circle,
                size: 30.0,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("User 01"),
                Text("test@sandboxnetwork.net"),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                _CustomAlert(context);
              },
              iconSize: 30,
              icon: const Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> _CustomAlert(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: SizedBox(
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('계정정보 변경'),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('확인'),
        ),
      ],
    ),
  );
}

class _SoundSwitch extends StatefulWidget {
  const _SoundSwitch({super.key});

  @override
  State<_SoundSwitch> createState() => _SoundSwitchState();
}

class _SoundSwitchState extends State<_SoundSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Sound"),
        Switch(value: isSwitched, onChanged: onChanged)
      ],
    );
  }

  dynamic onChanged(val) {
    setState(() {
      isSwitched = val;
    });
  }
}

class _VibrationSwitch extends StatefulWidget {
  const _VibrationSwitch({super.key});

  @override
  State<_VibrationSwitch> createState() => _VibrationSwitchState();
}

class _VibrationSwitchState extends State<_VibrationSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Vibration"),
        Switch(value: isSwitched, onChanged: onChanged)
      ],
    );
  }

  dynamic onChanged(val) {
    setState(() {
      isSwitched = val;
    });
  }
}
