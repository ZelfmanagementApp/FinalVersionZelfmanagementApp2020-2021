//Class Let op! dit is nog in het engels

class AgendaItem {
  static String table = "events";
  
  int id;
  String name;
  String date;

  AgendaItem({this.id, this.name, this.date});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name, 
      'date': date
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

    static AgendaItem fromMap(Map<String, dynamic> map) {
    return AgendaItem(
        id: map['id'],
        name: map['name'],
        date: map['date']);
  }
}
