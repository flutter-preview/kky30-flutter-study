import 'package:flutter/material.dart';

import '../constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _TopPart(onPressedSetting: onPressedSetting),
                    _BodyPart(),
                    _BottomPart(onPressedCreate: onPressedCreate),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressedSetting() {
  }

  onPressedCreate() {
  }
}

class _TopPart extends StatelessWidget {
  final VoidCallback onPressedSetting;

  const _TopPart({
    required this.onPressedSetting,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '랜덤 숫자 생성기',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          color: RED_COLOR,
          onPressed: () {},
        )
      ],
    );
  }
}

class _BodyPart extends StatelessWidget {
  const _BodyPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: 123
                .toString()
                .split('')
                .map((e) => Image.asset(
                      'asset/img/$e.png',
                      height: 70.0,
                      width: 50.0,
                    ))
                .toList(),
          ),
          Row(
            children: 456
                .toString()
                .split('')
                .map((e) => Image.asset(
                      'asset/img/$e.png',
                      height: 70.0,
                      width: 50.0,
                    ))
                .toList(),
          ),
          Row(
            children: 789
                .toString()
                .split('')
                .map((e) => Image.asset(
                      'asset/img/$e.png',
                      height: 70.0,
                      width: 50.0,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  final VoidCallback onPressedCreate;

  const _BottomPart({
    required this.onPressedCreate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: RED_COLOR,
        ),
        child: const Text('생성하기'),
      ),
    );
  }
}
