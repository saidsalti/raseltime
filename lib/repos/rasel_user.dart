class UserFrind {
  String userId;
  String fromUserId;
  String fromNickname;
  String email;
  String nickname;
  bool? isAccept;
  DateTime? created;
  UserFrind({
    required this.userId,
    required this.email,
    required this.nickname,
    required this.fromNickname,
    required this.fromUserId,
    this.created,
    this.isAccept,
  });
}
