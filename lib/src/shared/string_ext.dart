extension StringExtension on String {
  String toCamelcase() {
    return toLowerCase().replaceAllMapped(RegExp(r'\b\w'), (match) => match.group(0)!.toUpperCase());
    // return length > 1 ? substring(0, 1).toUpperCase() + substring(1, length) : this;
  }
}
