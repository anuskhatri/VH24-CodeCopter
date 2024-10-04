class Need {
  String organization;
  String title;
  String desc;
  String pendingAmt;

  Need({
    required this.organization,
    required this.title,
    required this.desc,
    required this.pendingAmt,
  });

  factory Need.fromJson(Map<String, dynamic> json) {
    return Need(
      organization: json['name'],
      title: json['title'],
      desc: json['description'],
      pendingAmt: json['pending_amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'organization': organization,
      'title': title,
      'desc': desc,
      'pendingAmt': pendingAmt,
    };
  }
}
