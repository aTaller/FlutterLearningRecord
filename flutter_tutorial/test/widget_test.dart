// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/testSourceCode/qi_counter.dart';
import 'package:flutter_tutorial/testSourceCode/qi_network.dart';
import 'package:dio/dio.dart';

void testCounter() {
  test('testCounter', () {
    final counter = QiCounter();
    expect(counter.countValue, 0);
    expect(counter.increment(), 1);
    expect(counter.increment(), 2);
    expect(counter.decrease(), 1);
  });
}

void testGroupCounter() {
  group("Counter Group Test", () {
    test('Counter初始化', () {
      final counter = QiCounter();
      expect(counter.countValue, 0);
    });

    test('Counter Increment', () {
      final counter = QiCounter();
      expect(counter.increment(), 1);
      expect(counter.countValue, 1);
    });

    test('Counter Increment', () {
      final counter = QiCounter();
      expect(counter.increment(), 1);
      expect(counter.decrease(), 0);
      expect(counter.countValue, 0);
      expect(counter.decrease(), -1);
      expect(counter.countValue, -1);
    });
  });

  test('testCounter', () {
    final counter = QiCounter();
    expect(counter.countValue, 0);
    expect(counter.increment(), 1);
    expect(counter.increment(), 2);
    expect(counter.decrease(), 1);
  });
}

Future<Response> testNetwork2() async {
  Response response;
  test('测试网络请求', () async {
    String testURLString = 'https://api.github.com/orgs/flutterchina/repos';
    response = await QiNetwork.request(urlString: testURLString);
    expectLater(response.statusCode, 200);
  });
  return response;
}

Future testNetwork() async {
  Response response;
  test('测试网络请求', () async {
    String testURLString = 'https://api.github.com/orgs/flutterchina/repos';
    await QiNetwork.request(urlString: testURLString).then((value) {
      response = value;
      expectLater(response.statusCode, 200);
      List responseList = response.data;
      Map responseFirstListMap = responseList.first;
      print(responseFirstListMap['name']);
      expect(responseFirstListMap['name'], 'dio');
    });
  });
}

void main() async {
  testNetwork();
  testNetwork2();

  testCounter();
  testGroupCounter();

  test('my first unit test', () {
    var answer = 68;

    // 单元测试通过
    expect(answer, 68);
    // 单元测试失败
    // expect(answer, 77);
  });

  test('测试描述信息', () {
    // 待测试代码
  });

  test('my first unit test', () {
    var answer = 68;

    // 单元测试通过
    expect(answer, 68);
    // 单元测试失败
    // expect(answer, 77);
  });

  test('String.split() splits the string on the delimiter', () {
    var string = 'foo,bar,baz';
    expect(string.split(','), equals(['foo', 'bar', 'baz']));
  });

  test('String.trim() removes surrounding whitespace', () {
    var string = '  foo ';
    expect(string.trim(), equals('foo'));
  });

  // group('groupTest', () {
  //   test('test1', () {});
  //   test('test2', () {});
  // });

  group('String', () {
    test('.split() splits the string on the delimiter', () {
      var string = 'foo,bar,baz';
      expect(string.split(','), equals(['foo', 'bar', 'baz']));
    });

    test('.trim() removes surrounding whitespace', () {
      var string = '  foo ';
      expect(string.trim(), equals('foo'));
    });
  });

  group('int', () {
    test('.remainder() returns the remainder of division', () {
      expect(11.remainder(3), equals(2));
    });

    test('.toRadixString() returns a hex string', () {
      expect(11.toRadixString(16), equals('b'));
    });

    // matcher
    test('.split() splits the string on the delimiter', () {
      expect('foo,bar,baz',
          allOf([contains('foo'), isNot(startsWith('bar')), endsWith('baz')]));
    });

    // 格式转换
    test('.parse() fails on invalid input', () {
      expect(() => int.parse('X'), throwsFormatException);
    });

    // 测试无法通过
    // test('.parse() fails on invalid input', () {
    //   expect(() => int.parse('6'), throwsFormatException);
    // });

    // You can use the setUp() and tearDown() functions to share code between tests. The setUp() callback will run before every test in a group or test suite, and tearDown() will run after. tearDown() will run even if a test fails, to ensure that it has a chance to clean up after itself.
    // HttpServer server;
    // Uri url;
    // setUp(() async {
    //   server = await HttpServer.bind('localhost', 0);
    //   url = Uri.parse('http://${server.address.host}:${server.port}');
    // });

    // tearDown(() async {
    //   await server.close(force: true);
    //   server = null;
    //   url = null;
    // });

    // 异步测试
    test('Future.value() returns the value', () async {
      var value = await Future.value(10);
      expect(value, equals(10));
    });
    // test('Future.value() returns the value', () async {
    //   var value = await Future.value(10);
    //   expect(value, equals(11));
    // });
    //   00:02 +10 -1: int Future.value() returns the value [E]
    // Expected: <11>
    //   Actual: <10>
    test('Future.value() returns the value', () {
      expect(Future.value(10), completion(equals(10)));
    });

    test('Future.error() throws the error', () {
      expect(Future.error('oh no'), throwsA(equals('oh no')));
      expect(Future.error(StateError('bad state')), throwsStateError);
    });

    test('Stream.fromIterable() emits the values in the iterable', () {
      var stream = Stream.fromIterable([1, 2, 3]);

      stream.listen(expectAsync1((number) {
        expect(number, inInclusiveRange(1, 3));
      }, count: 3));
    });

    // test('Stream.fromIterable() emits the values in the iterable', () {
    //   var stream = Stream.fromIterable([1, 2, 3]);

    //   stream.listen(expectAsync1((number) {
    //     expect(number, inInclusiveRange(1, 2));
    //   }, count: 3));
    // });
    //   Expected: be in range from 1 (inclusive) to 2 (inclusive)
    // Actual: <3>

    test('process emits status messages', () {
      // Dummy data to mimic something that might be emitted by a process.
      var stdoutLines =
          Stream.fromIterable(['Ready.', 'Loading took 150ms.', 'Succeeded!']);

      expect(
          stdoutLines,
          emitsInOrder([
            // Values match individual events.
            'Ready.',

            // Matchers also run against individual events.
            startsWith('Loading took'),

            // Stream matchers can be nested. This asserts that one of two events are
            // emitted after the "Loading took" line.
            emitsAnyOf(['Succeeded!', 'Failed!']),

            // By default, more events are allowed after the matcher finishes
            // matching. This asserts instead that the stream emits a done event and
            // nothing else.
            emitsDone
          ]));
    });

    // test('process emits a WebSocket URL', () async {
    //   // Wrap the Stream in a StreamQueue so that we can request events.
    //   var stdout = StreamQueue(Stream.fromIterable([
    //     'WebSocket URL:',
    //     'ws://localhost:1234/',
    //     'Waiting for connection...'
    //   ]));

    //   // Ignore lines from the process until it's about to emit the URL.
    //   await expectLater(stdout, emitsThrough('WebSocket URL:'));

    //   // Parse the next line as a URL.
    //   var url = Uri.parse(await stdout.next);
    //   expect(url.host, equals('localhost'));

    //   // You can match against the same StreamQueue multiple times.
    //   await expectLater(stdout, emits('Waiting for connection...'));
    // });
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    /*
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    */
  });

// 其他测试
  // Response response = await testNetwork();
  // print(response);
}
