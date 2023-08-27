// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// class ApiService {
//   var client = http.Client();

//   Future<dynamic> get(String url, {var headers}) async {
//     try {
//       var response = await client.get(Uri.parse(url), headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept-Encoding': 'gzip',
//       }).timeout(
//         const Duration(seconds: 15),
//         onTimeout: () async {
//           var result = await InternetAddress.lookup(url);
//           if (result.isEmpty || result[0].rawAddress.isEmpty) {
//             throw SocketException;
//           }
//           throw TimeoutException;
//         },
//       );
//       if (response.statusCode == HttpStatus.ok) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       log('Error: ${e.toString()}');
//     }
//   }
// }
import 'package:dio/dio.dart';

import 'interceptor.dart';

late Dio _dio;

class ApiService {
  ApiService() {
    _dio = Dio(
      BaseOptions(
        // baseUrl: ApiUrl.baseUrl,
        connectTimeout: const Duration(milliseconds: 15000),
      ),
    );
    dio.interceptors.add(ApiInterceptor());
  }

  Dio get dio => _dio;
}
