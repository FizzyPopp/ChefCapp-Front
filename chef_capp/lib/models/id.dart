class ID {
  final String _hash;
  ID(this._hash);
  String get hash => _hash;
  @override
  String toString() {
    return _hash;
  }
}