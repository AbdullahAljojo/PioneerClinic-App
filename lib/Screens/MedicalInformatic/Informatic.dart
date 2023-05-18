class informatic {
  String _name;
  String _image;
  String _description;

  informatic(this._name, this._image, this._description);
//Setters
  set name(String name) {
    name = _name;
  }

  set image(String image) {
    image = _image;
  }

  set description(String description) {
    description = _description;
  }

//Getters
  String get name => _name;
  String get image => _image;
  String get description => _description;
}
