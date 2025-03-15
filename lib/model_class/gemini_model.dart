class GeminiModel {
  List<Candidates>? candidates;
  String? modelVersion;
  UsageMetadata? usageMetadata;

  GeminiModel({this.candidates, this.modelVersion, this.usageMetadata});

  GeminiModel.fromJson(Map<String, dynamic> json) {
    candidates = json["candidates"] == null
        ? null
        : (json["candidates"] as List)
            .map((e) => Candidates.fromJson(e))
            .toList();
    modelVersion = json["modelVersion"];
    usageMetadata = json["usageMetadata"] == null
        ? null
        : UsageMetadata.fromJson(json["usageMetadata"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (candidates != null) {
      _data["candidates"] = candidates?.map((e) => e.toJson()).toList();
    }
    _data["modelVersion"] = modelVersion;
    if (usageMetadata != null) {
      _data["usageMetadata"] = usageMetadata?.toJson();
    }
    return _data;
  }
}

class UsageMetadata {
  int? candidatesTokenCount;
  int? totalTokenCount;
  int? promptTokenCount;

  UsageMetadata(
      {this.candidatesTokenCount, this.totalTokenCount, this.promptTokenCount});

  UsageMetadata.fromJson(Map<String, dynamic> json) {
    candidatesTokenCount = json["candidatesTokenCount"];
    totalTokenCount = json["totalTokenCount"];
    promptTokenCount = json["promptTokenCount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["candidatesTokenCount"] = candidatesTokenCount;
    _data["totalTokenCount"] = totalTokenCount;
    _data["promptTokenCount"] = promptTokenCount;
    return _data;
  }
}

class Candidates {
  String? finishReason;
  int? index;
  Content? content;

  Candidates({this.finishReason, this.index, this.content});

  Candidates.fromJson(Map<String, dynamic> json) {
    finishReason = json["finishReason"];
    index = json["index"];
    content =
        json["content"] == null ? null : Content.fromJson(json["content"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["finishReason"] = finishReason;
    _data["index"] = index;
    if (content != null) {
      _data["content"] = content?.toJson();
    }
    return _data;
  }
}

class Content {
  String? role;
  List<Parts>? parts;

  Content({this.role, this.parts});

  Content.fromJson(Map<String, dynamic> json) {
    role = json["role"];
    parts = json["parts"] == null
        ? null
        : (json["parts"] as List).map((e) => Parts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["role"] = role;
    if (parts != null) {
      _data["parts"] = parts?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Parts {
  String? text;

  Parts({this.text});

  Parts.fromJson(Map<String, dynamic> json) {
    text = json["text"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["text"] = text;
    return _data;
  }
}
