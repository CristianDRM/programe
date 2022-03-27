class Tag {
  const Tag({required this.name});
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tag &&
          runtimeType == other.runtimeType &&
          name.toLowerCase().trim() == other.name.toLowerCase().trim();

  @override
  int get hashCode => name.hashCode;
}
