import 'package:boylernaya/DataMapper/RecordsSensorsMapper.dart';
import 'package:boylernaya/TableModule/RecordsSensors.dart';
import 'package:boylernaya/widgets/StatusBoiler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'температура 79 С, уровень воды 499 мм',
    (WidgetTester tester) async {
      await checkStatusImage(
        tempWater: 79,
        levelWater: 499,
        imageColor: 'red',
        tester: tester,
      );
    },
  );
  testWidgets(
    'температура 79 С, уровень воды 500 мм',
    (WidgetTester tester) async {
      await checkStatusImage(
        tempWater: 79,
        levelWater: 500,
        imageColor: 'green',
        tester: tester,
      );
    },
  );

  testWidgets(
    'температура 79 С, уровень воды 501 мм',
    (WidgetTester tester) async {
      await checkStatusImage(
        tempWater: 79,
        levelWater: 501,
        imageColor: 'green',
        tester: tester,
      );
    },
  );
  testWidgets(
    'температура 80 С, уровень воды 499 мм',
    (WidgetTester tester) async {
      await checkStatusImage(
        tempWater: 80,
        levelWater: 499,
        imageColor: 'red',
        tester: tester,
      );
    },
  );
  testWidgets(
    'температура 80 С, уровень воды 500 мм',
    (WidgetTester tester) async {
      await checkStatusImage(
        tempWater: 80,
        levelWater: 500,
        imageColor: 'green',
        tester: tester,
      );
    },
  );
  testWidgets(
    'температура 80 С, уровень воды 501 мм',
    (WidgetTester tester) async {
      await checkStatusImage(
        tempWater: 80,
        levelWater: 501,
        imageColor: 'green',
        tester: tester,
      );
    },
  );
  testWidgets(
    'температура 81 С, уровень воды 499 мм',
    (WidgetTester tester) async {
      await checkStatusImage(
        tempWater: 81,
        levelWater: 499,
        imageColor: 'red',
        tester: tester,
      );
    },
  );
  testWidgets(
    'температура 81 С, уровень воды 500 мм',
    (WidgetTester tester) async {
      await checkStatusImage(
        tempWater: 81,
        levelWater: 500,
        imageColor: 'red',
        tester: tester,
      );
    },
  );
  testWidgets(
    'температура 81 С, уровень воды 501 мм',
    (WidgetTester tester) async {
      await checkStatusImage(
        tempWater: 81,
        levelWater: 501,
        imageColor: 'red',
        tester: tester,
      );
    },
  );
}

Future<void> checkStatusImage({
  @required int tempWater,
  @required int levelWater,
  @required String imageColor,
  @required WidgetTester tester,
}) async {
  RecordsSensors element = RecordsSensors(
    idUnit: 15,
    tempWater: tempWater,
    levelWater: levelWater,
  );
  await RecordsSensorsMapper().insert(element);

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: StatusBoiler(
          idSensor: 15,
        ),
      ),
    ),
  );
  var image = find.byType(Image);
  await tester.pump(Duration(seconds: 1, milliseconds: 500));

  bool imageWidget = image.toString().contains("assets/images/$imageColor.png");
  final waterText = find.text('Температура = $tempWater С');
  final levelWaterText = find.text('Уровень воды = $levelWater мм');

  expect(image, findsOneWidget);
  expect(waterText, findsOneWidget);
  expect(levelWaterText, findsOneWidget);
  expect(true, imageWidget);
}
