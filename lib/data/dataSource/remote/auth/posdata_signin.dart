import '../../../../core/class/crud.dart';
import '../../../../core/constant/backlinks.dart';

class PostDataSignin {
  Crud crud;
  PostDataSignin(this.crud);
  postDataSignin(String email, String password) async {
    var response = await crud.postData(
      signinNameLink,
      {"email": email, "password": password},
    );
    return response.fold((l) => l, (r) => r);
  }
}
