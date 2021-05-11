import 'package:hive/hive.dart';
part 'ContactMethods.dart';

@HiveType()
class Contact {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;
  Contact(this.name, this.age);
}