import 'package:graphql/client.dart';
import 'package:logger/logger.dart';
import 'package:remytest/services/logger.dart';

class ApiClient {
  // API KEY saved here for convenience,
  // in production would be saved in backend.
  static String apiKey = 'fa988929-6693-45c6-86c5-a10b63d4bf49';

  // GraphQL Instance
  static GraphQLClient instance = GraphQLClient(
      link: HttpLink('https://api.everbase.co/graphql?apikey=$apiKey'),
      cache: GraphQLCache());

  // query method
  static Future<QueryResult> query({required String query}) async {
    try {
      final QueryResult res = await instance.query(QueryOptions(
        document: gql(query),
      ));
      if (res.hasException) {
        if (res.exception!.linkException != null) {
          final dynamic error = res.exception!.linkException?.originalException;
          L.log(Level.error, 'GraphQL Link Exception Error: $error');
        }
        if (res.exception!.graphqlErrors.isNotEmpty) {
          for (final GraphQLError error in res.exception!.graphqlErrors) {
            L.log(Level.error, 'GraphQL Error: $error');
          }
        }
        throw res.exception!;
      }
      return res;
    } catch (e) {
      L.log(Level.error, 'GraphQL Instance query error $e');
      throw GraphQLException(message: 'GraphQL Instance query error $e');
    }
  }
}

// A custom exception to be thrown by the GraphQL Instance
class GraphQLException implements Exception {
  GraphQLException({this.message});

  String? message;

  @override
  String toString() => 'GraphQL Error : $message';
}

// A custom exception to be thrown by the GraphQL Instance
class NetworkException implements Exception {
  NetworkException({this.statusCode, this.message});

  String? message;
  int? statusCode;

  @override
  String toString() => 'Network Error (Code : $statusCode) : $message';
}
