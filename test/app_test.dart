import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';

import 'package:remytest/models/country.dart';
import 'package:remytest/services/api_client.dart';

void main() {
  test('Fetch countries api call', () async {
    const String query = r'''{
        countries {
          name
          population
          capital {
            name
          }
        }
      }
    ''';
    final QueryResult res = await ApiClient.query(query: query);
    expect(res.hasException, false);
    if (!res.hasException) {
      expect(res.data!['countries'].length, isNonZero);
    }
  });

  test('Country mapping method', () {
    final Map<String, dynamic> map = {
      'name': 'United States',
      'population': 300000000,
      'capital': <String, dynamic>{'name': 'Washington, D.C.'}
    };
    final Country country = Country.fromMap(map);
    expect(country.name, 'United States');
    expect(country.capital, 'Washington, D.C.');
    expect(country.population, '300,000,000');
  });
}
