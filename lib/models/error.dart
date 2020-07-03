class Errors {
  List<Errors> errors;

  Errors({this.errors});

  Errors.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = new List<Errors>();
      json['errors'].forEach((v) {
        errors.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Error {
  String message;
  List<Locations> locations;
  List<String> path;
  Extensions extensions;

  Error({this.message, this.locations, this.path, this.extensions});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['locations'] != null) {
      locations = new List<Locations>();
      json['locations'].forEach((v) {
        locations.add(new Locations.fromJson(v));
      });
    }
    path = json['path'].cast<String>();
    extensions = json['extensions'] != null
        ? new Extensions.fromJson(json['extensions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.locations != null) {
      data['locations'] = this.locations.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    if (this.extensions != null) {
      data['extensions'] = this.extensions.toJson();
    }
    return data;
  }
}

class Locations {
  int line;
  int column;

  Locations({this.line, this.column});

  Locations.fromJson(Map<String, dynamic> json) {
    line = json['line'];
    column = json['column'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line'] = this.line;
    data['column'] = this.column;
    return data;
  }
}

class Extensions {
  String code;
  Exception exception;

  Extensions({this.code, this.exception});

  Extensions.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    exception = json['exception'] != null
        ? new Exception.fromJson(json['exception'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.exception != null) {
      data['exception'] = this.exception.toJson();
    }
    return data;
  }
}

class Exception {
  int code;
  Message data;
  List<String> stacktrace;

  Exception({this.code, this.data, this.stacktrace});

  Exception.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Message.fromJson(json['data']) : null;
    stacktrace = json['stacktrace'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['stacktrace'] = this.stacktrace;
    return data;
  }
}

class Data {
  int statusCode;
  String error;
  List<Message> message;
  List<Data> data;

  Data({this.statusCode, this.error, this.message, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    error = json['error'];
    if (json['message'] != null) {
      message = new List<Message>();
      json['message'].forEach((v) {
        message.add(new Message.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['error'] = this.error;
    if (this.message != null) {
      data['message'] = this.message.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  List<Messages> messages;

  Message({this.messages});

  Message.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = new List<Messages>();
      json['messages'].forEach((v) {
        messages.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  String id;
  String message;

  Messages({this.id, this.message});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    return data;
  }
}
