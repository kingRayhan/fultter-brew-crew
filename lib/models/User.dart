/**
 * Fire base user response interface
 */
class User {
  final String uid;
  User({this.uid});

  @override
  String toString() {
    return "{ userId: $uid }";
  }
}
