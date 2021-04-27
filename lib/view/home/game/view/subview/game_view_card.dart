part of '../game_view.dart';

extension _GameViewGamesCard on GameView {
  Widget buildColumnUpdate(GameViewModel viewModel) {
    return viewModel.onTopGameItems().toBuild<List<GameModel>?>(
        onSuccess: (data) {
          return Column(
            children: [
              HeaderButton(titleText: LocaleKeys.menu_game_newUpdate),
              GameGrid(
                models: data,
              )
            ],
          );
        },
        loadingWidget: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey[200]!,
          child: ListTile(
            leading: CircleAvatar(),
            title: Text('data'),
            subtitle: Text('data'),
          ),
        ),
        notFoundWidget: Text('Not Found'),
        onError: Text('ERRROR'));
  }

  Widget buildColumnNewCard(GameViewModel viewModel) {
    return viewModel.onNewsGameItems().toBuild<List<GameModel>?>(
        onSuccess: (data) {
          return Column(
            children: [
              HeaderButton(titleText: LocaleKeys.menu_game_topDownload),
              GameGrid(
                models: data,
              )
            ],
          );
        },
        loadingWidget: CircularProgressIndicator(),
        notFoundWidget: Text('Not Found'),
        onError: Text('ERRROR'));
  }
}
