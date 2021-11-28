class Followers {
  final String login;
  final String avatar_url;
  final String git_url; 
 
  Followers(
      {required  this.login, required this.avatar_url, required this.git_url});
 
  factory Followers.fromJson(Map<String, dynamic> json) {
    return Followers(
     login: json['login'],
     avatar_url : json['avatar_url'],
     git_url : json['url'],
    );
  }
}