class Post {
  String qRCode;
  String status;
  String hASH;

  Post({this.qRCode, this.status, this.hASH});

  Post.fromJson(Map<String, dynamic> json) {
    qRCode = json['QRCode'];
    status = json['status'];
    hASH = json['HASH'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QRCode'] = this.qRCode;
    data['status'] = this.status;
    data['HASH'] = this.hASH;
    return data;
  }
}
