import 'package:flutter_firebase_starter/helpers/backend/http_helper.dart';

String baseUrl = "https://picsum.photos";

getImages() {
  String endpoint = 'https://picsum.photos/v2/list';
  RequestHelper.getRequest(endpoint).then(
    (data) {
      print(data);
    },
  );
}
