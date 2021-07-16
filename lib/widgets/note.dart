class Note {
  final int id;
  final String value;

  String toString() {
    return 'Note:{id:${id}, value:${value}}';
  }

  Note(this.id, this.value);
}
