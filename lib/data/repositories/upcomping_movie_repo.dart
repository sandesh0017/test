import '../models/upcoming_movie_model.dart';
import 'api/api_constants.dart';
import 'api/api_services.dart';

class UpcomingRepository {
  ApiService api = ApiService();

  Future<List<dynamic>> fetchData() async {
    var url = APIUrl.nowShows;

    try {
      var result = await api.dio.get(url);
      var response = result;
      List<dynamic> dataList = response.data["results"]
          .map((i) => UpcomingMovieModel.fromJson(i))
          .toList();

      return dataList;
    } catch (e) {
      throw (e.toString());
    }
  }
}
