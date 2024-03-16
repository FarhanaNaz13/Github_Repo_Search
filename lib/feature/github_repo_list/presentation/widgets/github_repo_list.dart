import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_treasures/core/resource/dimension_const.dart';
import 'package:github_treasures/feature/common/presentation/widgets/common_text_widget.dart';
import 'package:github_treasures/feature/common/resource/string_res.dart';
import 'package:github_treasures/feature/github_repo_list/core/route/github_repo_list_route_module.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repository_list_entity.dart';
import 'package:github_treasures/feature/github_repo_list/domain/usecase/github_repo_list_uc.dart';
import 'package:github_treasures/feature/github_repo_list/presentation/bloc/github_repo_list_cubit/github_repo_list_cubit.dart';
import 'package:github_treasures/feature/github_repo_list/presentation/widgets/github_repo_search_top.dart';
import 'package:github_treasures/feature/github_repo_list/presentation/widgets/repo_item_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RepoList extends StatefulWidget {
  const RepoList({super.key});

  @override
  State<RepoList> createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  final scrollController = ScrollController();
  static const _pageSize = 10;
  final TextEditingController searchController = TextEditingController();
  final PagingController<int, GithubRepoItemEntity> _pagingController =
      PagingController(firstPageKey: 0);

  final repo = GetIt.instance.get<GithubRepoListUc>();

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final params = GithubRepoListParams(
        query: searchController.text.trim(),
        sort: 'stars',
        order: 'desc',
        page: pageKey,
        perPage: _pageSize,
      );
      final itemResult = await repo.call(params: params);

      itemResult.fold(
        (l) => null,
        (dataGroup) {
          dataGroup.maybeWhen(
            orElse: () {},
            success: (entityList) {
              final isLastPage = (entityList.length) < _pageSize;
              if (isLastPage) {
                _pagingController.appendLastPage(entityList);
              } else {
                _pagingController.appendPage(entityList, ++pageKey);
              }
            },
          );
        },
      );
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GithubRepoSearchTop(
          onPressed: () => searchController.text.isNotEmpty
              ? context.read<GithubRepoListCubit>().getList(
                    params: GithubRepoListParams(
                      query: searchController.text,
                      sort: 'stars',
                      order: 'desc',
                      page: 0,
                      perPage: _pageSize,
                    ),
                  )
              : null,
          searchController: searchController,
          onChanged: (String value) {},
        ),
        BlocBuilder<GithubRepoListCubit, GithubRepoListState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox(),
              loading: () => const Padding(
                padding: EdgeInsets.only(top: DimensionConst.value16),
                child: CircularProgressIndicator(),
              ),
              loaded: (entity) {
                return Expanded(
                  child: PagedListView<int, GithubRepoItemEntity>(
                    pagingController: _pagingController,
                    builderDelegate:
                        PagedChildBuilderDelegate<GithubRepoItemEntity>(
                      itemBuilder: (context, item, index) {
                        return RepoItemCard(
                          repoItemEntity: item,
                          onTap: () {
                            Navigator.pushNamed(
                                context,
                                GithubRepoListRouteModule
                                    .githubRepoListDetailScreen,
                                arguments: item);
                          },
                        );
                      },
                      firstPageErrorIndicatorBuilder: (context) => const Center(
                        child:
                            CommonTextWidget(text: StringRes.errorLoadingData),
                      ),
                      noItemsFoundIndicatorBuilder: (context) => const Center(
                        child: CommonTextWidget(text: StringRes.noDataFound),
                      ),
                      noMoreItemsIndicatorBuilder: (context) => const Center(
                        child:
                            CommonTextWidget(text: StringRes.noMoreItemsFound),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
