class CustomerInputModel {
  final String id;
  final String? email;
  final String? name;

  CustomerInputModel(
      {required this.id, required this.email, required this.name});
  toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }
}
