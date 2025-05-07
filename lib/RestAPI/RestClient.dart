import 'dart:convert';
import 'package:crud/Style/style.dart';
import 'package:http/http.dart' as http;

Future<bool> ProductCreateRequest(FormValues) async {
  var URL = Uri.parse("http://35.73.30.144:2008/api/v1/CreateProduct");
  var PostBody = jsonEncode(FormValues);
  var PostHeader = {"Content-Type": "application/json"};
  var response= await http.post(URL, headers: PostHeader, body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=jsonDecode(response.body);

  if (ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
    else {
      ErrorToast("Request Fail ! Try Again");
      return false;
  }

}
