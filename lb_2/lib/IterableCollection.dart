class IterableCollection implements Iterable<IterableCollection> {
  int number;
  List<IterableCollection> iterableCollection = List();

  @override
  bool any(bool Function(IterableCollection element) test) => iterableCollection.any(test);

  @override
  Iterable<R> cast<R>() => iterableCollection.cast<R>();

  @override
  bool contains(Object element) => iterableCollection.contains(element);

  @override
  IterableCollection elementAt(int index) => iterableCollection.elementAt(index);

  @override
  bool every(bool Function(IterableCollection element) test) => iterableCollection.every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(IterableCollection element) f) => iterableCollection.expand<T>(f);

  @override
  IterableCollection get first => iterableCollection.first;

  @override
  IterableCollection firstWhere(bool Function(IterableCollection element) test, {IterableCollection Function() orElse}) => iterableCollection.firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue, T Function(T previousValue, IterableCollection element) combine) => iterableCollection.fold<T>(initialValue, combine);

  @override
  Iterable<IterableCollection> followedBy(Iterable<IterableCollection> other) => iterableCollection.followedBy(other);

  @override
  void forEach(void Function(IterableCollection element) f) => iterableCollection.forEach(f);

  @override
  bool get isEmpty => iterableCollection.isEmpty;

  @override
  bool get isNotEmpty => iterableCollection.isNotEmpty;

  @override
  Iterator<IterableCollection> get iterator => iterableCollection.iterator;

  @override
  String join([String separator = ""]) => iterableCollection.join(separator);

  @override
  IterableCollection get last => iterableCollection.last;

  @override
  IterableCollection lastWhere(bool Function(IterableCollection element) test, {IterableCollection Function() orElse}) => iterableCollection.lastWhere(test, orElse: orElse);

  @override
  int get length => iterableCollection.length;

  @override
  Iterable<T> map<T>(T Function(IterableCollection e) f) => iterableCollection.map(f);

  @override
  IterableCollection reduce(IterableCollection Function(IterableCollection value, IterableCollection element) combine) => iterableCollection.reduce(combine);

  @override
  IterableCollection get single => iterableCollection.single;

  @override
  IterableCollection singleWhere(bool Function(IterableCollection element) test, {IterableCollection Function() orElse}) => iterableCollection.singleWhere(test, orElse: orElse);

  @override
  Iterable<IterableCollection> skip(int count) => iterableCollection.skip(count);

  @override
  Iterable<IterableCollection> skipWhile(bool Function(IterableCollection value) test) => iterableCollection.skipWhile(test);

  @override
  Iterable<IterableCollection> take(int count) => iterableCollection.take(count);

  @override
  Iterable<IterableCollection> takeWhile(bool Function(IterableCollection value) test) => iterableCollection.takeWhile(test);

  @override
  List<IterableCollection> toList({bool growable = true}) => iterableCollection.toList(growable: growable);

  @override
  Set<IterableCollection> toSet() => iterableCollection.toSet();

  @override
  Iterable<IterableCollection> where(bool Function(IterableCollection element) test) => iterableCollection.where(test);

  @override
  Iterable<T> whereType<T>() => iterableCollection.whereType<T>();
}