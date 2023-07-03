import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingScreen extends StatefulWidget {
  final int number;

  const SettingScreen({
    required this.number,
    super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int maxNumber = 1000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    maxNumber = widget.number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: PRIMARY_COLOR,
      ),
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              _TopPart(
                maxNumber: maxNumber,
              ),
              _Slider(
                maxNumber: maxNumber.toDouble(),
                onChangedSlider: onChangedSlider,
              ),
              _BottomPart(
                onPressedSet: onPressedSet,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onChangedSlider(double maxNumber) {
    setState(() {
      this.maxNumber = maxNumber.toInt();
    });
  }

  onPressedSet() {
    Navigator.of(context).pop(maxNumber);
  }
}

class _TopPart extends StatelessWidget {
  final int maxNumber;

  const _TopPart({
    required this.maxNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: maxNumber
              .toString()
              .split('')
              .asMap()
              .entries
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                      left: e.key == maxNumber.toString().length ? 0 : 12),
                  child: Image.asset(
                    'asset/img/${e.value}.png',
                    width: 50,
                    height: 100,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double> onChangedSlider;

  const _Slider({
    required this.maxNumber,
    required this.onChangedSlider,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: maxNumber,
      min: 0,
      max: 100000,
      onChanged: onChangedSlider,
    );
  }
}

class _BottomPart extends StatelessWidget {
  final VoidCallback onPressedSet;

  const _BottomPart({
    required this.onPressedSet,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressedSet,
        style: ElevatedButton.styleFrom(
          backgroundColor: RED_COLOR,
        ),
        child: Text('설정하기'),
      ),
    );
  }
}
