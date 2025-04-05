import 'package:electronicsshop_app/cores/app_exports.dart';


final productRepositoryProvider = Provider(
        (ref) => ProductRepository(
            client: Client(),
            localStorageRepository: LocalStorageRepository()
        ),
);


class ProductRepository {

  final Client _client;
  final LocalStorageRepository _localStorageRepository;
  ProductRepository({
    required Client client,
    required LocalStorageRepository localStorageRepository,
  }) : _client = client,
        _localStorageRepository = localStorageRepository;




  Future<ErrorModel> getAllProducts()async{
    ErrorModel error =
    ErrorModel(error: 'An unexpected error occurred', data: null);

    try{
      String? token = await _localStorageRepository.getToken();
      if(token != null){
        var res = await _client.get(
          Uri.parse('$host/product'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token', // Pass token for authentication
          },
        );
        if (res.statusCode == 200) {
          final List<dynamic> productListJson = jsonDecode(res.body);
          final products = ProductModel.fromJsonList(productListJson);
          error = ErrorModel(error: null, data: products);
        } else {
          error = ErrorModel(error: 'Failed to load products', data: null);
        }
      }
    }catch(e){
      error = ErrorModel(error: e.toString(), data: null);
    }

    return error;
  }
}