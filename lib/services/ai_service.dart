import 'package:dio/dio.dart';

class AiItenirerayService {
  late final _apiLink;
  late final Dio _dio;

  AiItenirerayService() {
    _apiLink = "https://c4-na.altogic.com/e:64412d6773af66b5266b4fda";
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

  Future<Map<dynamic, dynamic>> getItenirary(Map data) async {
    var prompt =
        "Generate a personalized travel itinerary for a trip to ${data["destination"]} with a budget of ${data["budget"]}. The traveler is interested in a ${data["duration"]} vacation and enjoys ${data["interests"]}. They are looking for simple accommodations and prefer car transportation. The itinerary should include ${data["actitivity"]} activities. Please provide a detailed itinerary with daily recommendations for ${data["duration"]} days, including suggested destinations, activities, and dining options. The itinerary should be written in ${data["language"]}.";
    var data2 = {
      "prompt": prompt,
      // "limit": 11
      // transfer - 4, pending - 0, completed - 1
    };

    try {
      Response response = await _dio.post(
        '/travel',
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
