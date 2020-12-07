import 'package:allocation_app/services/hashing_service.dart';
import 'package:test/test.dart';

void main() {
  test('Same info should result in the same result', () {
    final hs = HashingService();

    final email = 'a';
    final supply = 1;
    final recipients = 2;
    final timestamp = 'c';
    final selection = [1];

    final json = hs.toJson(email, supply, recipients, timestamp, selection);

    final result = hs.hashJSON(json);
    expect(hs.hashJSON(json), equals(result));
  });
  test('Different info should have different results', () {
    final hs = HashingService();

    final email = 'a';
    final supply = 1;
    final recipients = 2;
    final timestamp = 'c';
    final selection = [1];

    final json_a = hs.toJson(email, supply, recipients, timestamp, selection);

    final email_b = 'y';
    final supply_b = 9;
    final recipients_b = 10;
    final timestamp_b = 'z';
    final selection_b = [1,2,3,4,5,6,7,8,9];

    final json_b = hs.toJson(email_b, supply_b, recipients_b, timestamp_b, selection_b);

    final result_a = hs.hashJSON(json_a);
    final result_b = hs.hashJSON(json_b);

    expect(result_a, isNot(result_b));
  });

}
