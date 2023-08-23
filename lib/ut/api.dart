class ApiEndPoints {
  static final String baseUrl = 'http://127.0.0.1:8000/api/manager';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}


class _AuthEndPoints {
  final String registerEmail = 'authaccount/register';

  final String loginEmail = 'authaccount/login';

}