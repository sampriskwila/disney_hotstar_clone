import 'package:dio/dio.dart';

import '../constants/constants.dart';
import '../exceptions/exceptions.dart';
import '../models/models.dart';

class TMDBRepository {
  final Dio _dio = Dio();

  Future<MovieResponse> getMoviesCarousel() async {
    var params = {"api_key": AppConstants.apiKey};

    try {
      Response response = await _dio.get(
        '${AppConstants.baseUrl}/trending/movie/week',
        queryParameters: params,
      );
      return MovieResponse.withSuccess(response.data);
    } on DioError catch (error) {
      throw DioExceptions.withError(error).toString();
    }
  }

  Future<MovieResponse> getTopPicks() async {
    var params = {"api_key": AppConstants.apiKey};

    try {
      Response response = await _dio.get(
        '${AppConstants.baseUrl}/trending/movie/day',
        queryParameters: params,
      );
      return MovieResponse.withSuccess(response.data);
    } on DioError catch (error) {
      throw DioExceptions.withError(error).toString();
    }
  }

  Future<MovieDetailResponse> getMovieDetails(int id) async {
    var params = {"api_key": AppConstants.apiKey};

    try {
      Response response = await _dio.get(
        '${AppConstants.baseUrl}/movie/$id',
        queryParameters: params,
      );
      return MovieDetailResponse.withSuccess(response.data);
    } on DioError catch (error) {
      throw DioExceptions.withError(error).toString();
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": AppConstants.apiKey};

    try {
      Response response = await _dio.get(
        '${AppConstants.baseUrl}/movie/$id/similar',
        queryParameters: params,
      );
      return MovieResponse.withSuccess(response.data);
    } on DioError catch (error) {
      throw DioExceptions.withError(error).toString();
    }
  }

  Future<MovieVideoResponse> getMovieVideos(int id) async {
    var params = {"api_key": AppConstants.apiKey};

    try {
      Response response = await _dio.get(
        '${AppConstants.baseUrl}/movie/$id/videos',
        queryParameters: params,
      );
      return MovieVideoResponse.withSuccess(response.data);
    } on DioError catch (error) {
      throw DioExceptions.withError(error).toString();
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": AppConstants.apiKey};

    try {
      Response response = await _dio.get(
        '${AppConstants.baseUrl}/genre/movie/list',
        queryParameters: params,
      );
      return GenreResponse.withSuccess(response.data);
    } on DioError catch (error) {
      throw DioExceptions.withError(error).toString();
    }
  }

  Future<MovieResponse> getMoviesByGenre(int id, [int page = 1]) async {
    var params = {"api_key": AppConstants.apiKey, "with_genres": id, "page": page};

    try {
      Response response = await _dio.get(
        '${AppConstants.baseUrl}/discover/movie',
        queryParameters: params,
      );
      return MovieResponse.withSuccess(response.data);
    } on DioError catch (error) {
      throw DioExceptions.withError(error).toString();
    }
  }
}
