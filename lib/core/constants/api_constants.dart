
class ApiConstants
{
  // final Dio _dio;
  static const baseUrl = "https://api.escuelajs.co/api/v1/";

  // Auth
  static login(email,password) => '${baseUrl}auth/login?email=$email&password=$password';
  static const getUserWithSession = '${baseUrl}auth/profile';

  // Products
  static const getAllProducts = '${baseUrl}products';
  static const getFirst10Products = '${baseUrl}products?offset=0&limit=10';
  static const createProduct = '${baseUrl}products';
  static getSingleProduct(id) => '${baseUrl}products/$id';
  static updateSingleProduct(id) => '${baseUrl}products/$id';

  //Users
  static const checkEmail = '${baseUrl}users/is-available';
  static const signUp = '${baseUrl}users';
  static getSingleUser(id) => '${baseUrl}users';
}
