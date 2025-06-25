class AlbumApi {
  Future<String> fetchData() async {
    return Future.delayed(Duration(seconds: 3), () {
      return 'Data fetched from API';
    });
  }
}
