part of 'fetch_product_details_cubit.dart';

abstract class FetchProductDetailsState extends Equatable {
  const FetchProductDetailsState();

  @override
  List<Object> get props => [];
}

class FetchProductDetailsInitial extends FetchProductDetailsState {}

class FetchProductDetailsFailure extends FetchProductDetailsState {
  final String errMessage;

  const FetchProductDetailsFailure(this.errMessage);
}

class FetchProductDetailsLoading extends FetchProductDetailsState {}

class FetchProductDetailsSuccess extends FetchProductDetailsState {
  final ProductDetailsEntity productDetails;

  const FetchProductDetailsSuccess(this.productDetails);
}
