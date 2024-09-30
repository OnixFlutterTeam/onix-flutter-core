import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

const _initialData = {
  'testString': 'mockedStringData',
  'testBool': true,
  'testInt': 1,
  'testDouble': 1.0,
  'testListString': ['a', 'b', 'c'],
};

void main() {
  final BasePreferences basePrefs = BasePreferences();

  group(
    'Unit tests for the get method',
    () {
      setUpAll(() {
        SharedPreferences.setMockInitialValues(_initialData);
      });

      test('Get with valid String key. Return correct String value', () async {
        final result = await basePrefs.get('testString', 'defaultValue');
        expect(result, equals('mockedStringData'));
      });

      test('Get with invalid String key. Return default String value',
          () async {
        final result = await basePrefs.get('testString1', 'defaultValue');
        expect(result, equals('defaultValue'));
      });

      test('Get with valid Bool key. Return correct Bool value', () async {
        final result = await basePrefs.get('testBool', false);
        expect(result, equals(true));
      });

      test('Get with invalid Bool key. Return default Bool value', () async {
        final result = await basePrefs.get('testBool1', false);
        expect(result, equals(false));
      });

      test('Get with valid Int key. Return correct Int value', () async {
        final result = await basePrefs.get('testInt', 2);
        expect(result, equals(1));
      });

      test('Get with invalid Int key. Return default Int value', () async {
        final defaultResult = await basePrefs.get('testInt1', 0);
        expect(defaultResult, equals(0));
      });

      test('Get with valid Double key. Return correct Double value', () async {
        final result = await basePrefs.get('testDouble', 0.0);
        expect(result, equals(1.0));
      });

      test('Get with invalid Double key. Return default Double value',
          () async {
        final defaultResult = await basePrefs.get('testDouble1', 0.0);
        expect(defaultResult, equals(0.0));
      });

      test('Get with valid List<String>. Return correct List<String> value',
          () async {
        final result = await basePrefs.get('testListString', ['a', 'b', 'c']);
        await basePrefs.get('testListString', ['default']);
        expect(result, equals(['a', 'b', 'c']));
      });

      test(
          'Get with invalid List<String> key. Return default List<String> value',
          () async {
        final result = await basePrefs.get('testListString1', ['default']);
        expect(result, equals(['default']));
      });

      test('Get with Unsupported type, return defaultValue', () async {
        final result = await basePrefs.get('testKey', [1]);
        expect(result, equals([1]));
      });
    },
  );

  group('Unit tests for the put method', () {
    setUpAll(() {
      SharedPreferences.setMockInitialValues(_initialData);
    });

    test('Put valid String value, return saved value', () async {
      await basePrefs.put('testString', 'testValue');
      final value = await basePrefs.get('testString', 'defaultValue');
      expect(value, equals('testValue'));
    });

    test('Put valid Bool value, return saved value', () async {
      await basePrefs.put('testBool', false);
      final value = await basePrefs.get('testBool', false);
      expect(value, equals(false));
    });

    test('Put valid int value, return saved value', () async {
      await basePrefs.put('testInt', 2);
      final value = await basePrefs.get('testInt', -2);
      expect(value, equals(2));
    });

    test('Put valid double value, return saved value', () async {
      await basePrefs.put('testDouble', 2.0);
      final value = await basePrefs.get('testDouble', -2.0);
      expect(value, equals(2));
    });

    test('Put valid List<String> value, return saved value', () async {
      await basePrefs.put('testListString', ['d', 'f', 'a']);
      final value = await basePrefs.get('testListString', ['a', 'b', 'c']);
      expect(value, equals(['d', 'f', 'a']));
    });

    test('Put unsupported List<int> value, return default value', () async {
      await basePrefs.put('testKey', [1, 2, 3]);
      final value = await basePrefs.get('testKey', [4, 5, 6]);
      expect(value, equals([4, 5, 6]));
    });
  });
}
