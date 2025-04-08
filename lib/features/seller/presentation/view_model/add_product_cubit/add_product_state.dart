part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductSuccess extends AddProductState {}

final class AddProductFailed extends AddProductState {
  final String errMessage;

  AddProductFailed({required this.errMessage});
}
