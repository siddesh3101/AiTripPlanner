import 'package:dio/dio.dart';

class ItineraryService {
  late final _apiLink;
  late final Dio _dio;

  ItineraryService() {
    _apiLink = "https://E4.adityasurve1.repl.co";
    _dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
        },
        baseUrl: _apiLink,
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 200) < 500;
        },
      ),
    );
    // _timeNow = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  Future<Map<dynamic, dynamic>> createItinerary(String place, int date) async {
    var data2 = {
      "location": place,
      "limit": date
      // transfer - 4, pending - 0, completed - 1
    };
    print(data2);

    try {
      Response response = await _dio.post(
        '/itenary',
        data: data2,
      );

      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<dynamic>> getItinerary() async {
    try {
      Response response = await _dio.get(
        '/trending',
      );

      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
