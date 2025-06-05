class SampleDatabaseModel {
  int? id;
  String? name;

  SampleDatabaseModel(this.id, this.name);

  SampleDatabaseModel.fromMap(Map map) {
    id = map[id];
    name = map[name];
  }
}
