

abstract class Failures{
  final List<dynamic> properties;

  const Failures({this.properties = const []});

}


class ServerFailure extends Failures{
  final String message;

  const ServerFailure(this.message);
}

class CacheFailure extends Failures{
  final String message;

  const CacheFailure(this.message);
}
