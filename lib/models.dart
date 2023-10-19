class User {
  String title;
  String firstname;
  String lastname;
  String imageUrl;
  String email;

  User(
      {required this.email,
      required this.firstname,
      required this.imageUrl,
      required this.lastname,
      required this.title});

  factory User.fromMapToObject(Map result) {
    return User(
        email: result["email"],
        firstname: result["name"]["first"],
        imageUrl: result["picture"]["medium"],
        lastname: result["name"]["last"],
        title: result["name"]["title"]);
  }
}
