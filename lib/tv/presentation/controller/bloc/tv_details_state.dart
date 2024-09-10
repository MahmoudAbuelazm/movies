part of 'tv_details_bloc.dart';

class TvDetailsState extends Equatable {
  final RequestState tvDetailsRequestState;
  final String tvDetailsMessage;
  final TvMovieDetails? tvDetails;
  final RequestState moreLikeThisRequestState;
  final String moreLikeThisMessage;
  final List<MoreLikeThis>? moreLikeThis;

  const TvDetailsState({
    this.tvDetailsRequestState = RequestState.loading,
    this.tvDetailsMessage = '',
    this.tvDetails,
    this.moreLikeThisRequestState = RequestState.loading,
    this.moreLikeThisMessage = '',
    this.moreLikeThis,
  });

  TvDetailsState copyWith({
    RequestState? tvDetailsRequestState,
    String? tvDetailsMessage,
    TvMovieDetails? tvDetails,
    RequestState? moreLikeThisRequestState,
    String? moreLikeThisMessage,
    List<MoreLikeThis>? moreLikeThis,
  }) {
    return TvDetailsState(
      tvDetailsRequestState:
          tvDetailsRequestState ?? this.tvDetailsRequestState,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      tvDetails: tvDetails ?? this.tvDetails,
      moreLikeThisRequestState:
          moreLikeThisRequestState ?? this.moreLikeThisRequestState,
      moreLikeThisMessage: moreLikeThisMessage ?? this.moreLikeThisMessage,
      moreLikeThis: moreLikeThis ?? this.moreLikeThis,
    );
  }

  @override
  List<Object?> get props => [
        tvDetailsRequestState,
        tvDetailsMessage,
        tvDetails,
        moreLikeThisRequestState,
        moreLikeThisMessage,
        moreLikeThis
      ];
}
