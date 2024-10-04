class Need {
  String organization;
  String title;
  String desc;
  String current_funded_amt;

  Need({
    required this.organization,
    required this.title,
    required this.desc,
    this.current_funded_amt = '',
  });

  factory Need.fromJson(Map<String, dynamic> json) {
    return Need(
      organization: json['name'],
      title: json['title'],
      desc: json['description'],
      current_funded_amt: json['current_funded_amount']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'organization': organization,
      'title': title,
      'desc': desc,
      'current_funded_amt': current_funded_amt,
    };
  }
}
