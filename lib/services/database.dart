import 'package:graphql/client.dart';

import '../models/country.dart';
import '../services/api_client.dart';

class DatabaseService {
  static Future<List<Country>> getAllCountries() async {
    final List<Country> _list = <Country>[];
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
    if (res.data!.isNotEmpty) {
      final List<dynamic> rawCountries =
          res.data!['countries'] as List<dynamic>;
      for (final country in rawCountries) {
        _list.add(Country.fromMap(country as Map<String, dynamic>));
      }
    }
    return _list;
  }
}
