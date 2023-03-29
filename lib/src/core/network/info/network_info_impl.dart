



import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo{
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get getDidConnected => connectionChecker.hasConnection;
}