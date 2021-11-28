class Repository {

  final String link ;
  final String name;
  final String description;
  final String language;
  final int star;

  Repository({required  this.link, required this.name,required this.description, required this.language, required this.star});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      link : json['html_url'],
      name : json['name'],
      description: json['description'],
      language: json['language'],
      star: json['staredgazers_count'],
      
      );
  }
}