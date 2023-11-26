class UserDetails {
  String? id;
  String? fname;
  String? lname;
  String? profUrl;
  String? backUrl;
  String? phoneNum;

  UserDetails(
      {this.fname,
      this.lname,
      this.phoneNum,
      this.id,
      this.backUrl,
      this.profUrl});
  UserDetails.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    backUrl = json['backUrl'];
    profUrl = json['profUrl'];
    phoneNum = json['phoneNum'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'lname': lname,
        'fname': fname,
        'phoneNum': phoneNum,
        'backUrl': backUrl,
        'profUrl': profUrl
      };
}
