/// The use case interface for bussiness logic
///
/// [UseCase] require [Input] for [Output] asynchronously
abstract class UseCase<Output, Input> {
  Future<Output> call(Input params);
}

class NoParams {}
