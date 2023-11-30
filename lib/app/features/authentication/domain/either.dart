class Either<Left, Right> {
  final Left? _left;
  final Right? _right;
  final bool isLeft;

  Either(this._left, this._right, this.isLeft);

  factory Either.left(Left failure) => Either(failure, null, true);

  factory Either.right(Right value) => Either(null, value, false);

  T when<T>(T Function(Left) left, T Function(Right) right) =>
      isLeft ? left(_left as Left) : right(_right as Right);
}
