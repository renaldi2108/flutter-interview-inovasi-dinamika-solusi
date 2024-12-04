class JsonUtils {
  static List<T> convertList<T>(List<dynamic> jsonList, T Function(Map<String, dynamic>) fromJson) {
    return jsonList.map((json) => fromJson(json as Map<String, dynamic>)).toList();
  }
}