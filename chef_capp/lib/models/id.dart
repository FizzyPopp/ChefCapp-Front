// use dart uuid package?

class ID {
  final String _hash;
  ID(this._hash);
  String get hash => _hash;
  @override
  String toString() => _hash;
  bool equals(ID id) => id.hash == this.hash;
}