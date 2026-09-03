abstract class BaseApiService {
  Future<dynamic> getApi(String url);
  
  Future<dynamic> postapi(String url, dynamic data);
}
