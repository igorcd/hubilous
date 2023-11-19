class ConsultantModel {
  final String name;
  final String picture;
  final String city;
  final String country;
  final String manager;
  final String client;
  final int stepsDone;
  final String email;
  final String phone;
  final int totalSteps;

  ConsultantModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.picture,
    required this.city,
    required this.country,
    required this.manager,
    required this.client,
    required this.stepsDone,
    required this.totalSteps,
  });
}
