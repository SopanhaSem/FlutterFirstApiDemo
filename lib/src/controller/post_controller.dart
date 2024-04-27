import 'package:first_api_app/src/model/user_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class WelcomeController extends GetxController {
  Future getWelcome() async {
    final responseData =
        await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
    if (responseData.statusCode == 200) {
      return welcomeFromJson(responseData.body);
    }
    return [];
  }
}
