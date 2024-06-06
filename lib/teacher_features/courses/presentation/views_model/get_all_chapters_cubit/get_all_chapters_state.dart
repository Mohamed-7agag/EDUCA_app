part of 'get_all_chapters_cubit.dart';

sealed class GetAllChaptersState extends Equatable {
  const GetAllChaptersState();

  @override
  List<Object> get props => [];
}

final class GetAllChaptersInitial extends GetAllChaptersState {}

final class GetAllChaptersLoading extends GetAllChaptersState {}

final class GetAllChaptersSuccess extends GetAllChaptersState {
  final List<ChapterModel> chaptersList;

  const GetAllChaptersSuccess(this.chaptersList);
}

final class GetAllChaptersFailure extends GetAllChaptersState {
  final String message;

  const GetAllChaptersFailure(this.message);
}
