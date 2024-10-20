class NewsModel {
  final String imgurl;
  final String title;
  final String desc;
  final String tags;
  final String srcurl;
  final String category;
  final String src;

  NewsModel({
    required this.imgurl,
    required this.title,
    required this.desc,
    required this.tags,
    required this.srcurl,
    required this.category,
    required this.src,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      imgurl: json['imageurl'] as String,
      title: json['title'] as String,
      desc: json['body'] as String,
      tags: json['tags'] as String,
      srcurl: json['url'] as String,
      category: json['categories'] as String,
      src: json['source'] as String,
    );
  }
}
