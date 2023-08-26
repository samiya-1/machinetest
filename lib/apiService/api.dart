// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// class apiService{
//   Future<http.Response> login(String username,String password) {
//     return http.post(
//       Uri.parse('https://37be-59-94-203-60.ngrok-free.app/api/login_users'),
//       body: jsonEncode(<String, String>{
//         'username': username,
//         'password':password,
//       }),
//     );
//   }
//   Future getallProducts(){
//     return http.get(Uri.parse('https://37be-59-94-203-60.ngrok-free.app/api/get_medicine'));
//   }
//   Future getsingleProducts(int id){
//     return http.get(Uri.parse('https://37be-59-94-203-60.ngrok-free.app/api/single_medicine/$id'));
//   }
// }