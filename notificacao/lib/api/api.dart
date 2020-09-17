import 'package:http/http.dart' as http;

const urlAPI = "http://10.0.2.2:8080/api/cliente";

// link teste local
// http://10.0.2.2:8080/api/cliente // endereço 10.0.2.2 referente ao lopback


class API{
  static Future getSistemas() async {
    var url = urlAPI;
    return await http
                 .get(url)
                 .timeout(Duration(seconds: 15));  
  }  
}

// class API{
//   static Future getSistemas() async {
//     var url = urlAPI;
   
//     final response = await http
//                            .get(url)
//                            .timeout(Duration(seconds: 20));

//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       throw Exception('Failed to load');
//     }
  
//   }
// }