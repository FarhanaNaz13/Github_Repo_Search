class ApiEndPoints {
  static String githubRepoListSearchUrl({
    required String query,
    required String sort,
    required String order,
    required String page,
    required String perPage,
  }) =>
      "search/repositories?q=$query&page=$page&per_page=$perPage&sort=$sort&order=$order";
}
