import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/screen/setting_screen.dart';

import '../constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [123, 456, 789];
  int number = 100;

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
                    _BodyPart(number: number, numbers: numbers),
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

  onPressedSetting() async {
    final maxNumber = await Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) => SettingScreen(number: number)),
    );

    setState(() {
      if (maxNumber != null) {
        number = maxNumber;
      }
    });
  }

  onPressedCreate() {
    final rand = Random();
    final Set<int> randomNumbers = {};

    while (randomNumbers.length != 3) {
      randomNumbers.add(rand.nextInt(number));
    }

    setState(() {
      numbers = randomNumbers.toList();
    });
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
          onPressed: onPressedSetting,
        )
      ],
    );
  }
}

class _BodyPart extends StatelessWidget {
  final List<int> numbers;
  final int number;

  const _BodyPart({
    required this.numbers,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers
            .asMap()
            .entries
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(bottom: e.key == 2 ? 0 : 16),
                child: Row(
                  children: e.value
                      .toString()
                      .split('')
                      .map((e) => Image.asset(
                            'asset/img/$e.png',
                            height: 70.0,
                            width: 50.0,
                          ))
                      .toList(),
                ),
              ),
            )
            .toList(),
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
        onPressed: onPressedCreate,
        style: ElevatedButton.styleFrom(
          backgroundColor: RED_COLOR,
        ),
        child: const Text('생성하기'),
      ),
    );
  }
}
