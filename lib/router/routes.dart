enum Routes {
  root("/"),
  number("/number"),
  lot("/lot"),
  order("/order");

  final String path;

  const Routes(this.path);
}
