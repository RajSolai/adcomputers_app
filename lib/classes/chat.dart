class Chat {
  final String message;
  final String peerid;
  final String peername;
  final String timestamp;

  Chat({this.message,this.peerid,this.peername,this.timestamp});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
        message: json['message'],
        peerid: json['peerid'],
        peername: json['peername'],
        timestamp: json['timestamp']
    );
  }
}
