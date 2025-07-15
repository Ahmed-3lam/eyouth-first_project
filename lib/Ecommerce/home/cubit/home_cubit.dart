import 'package:bloc/bloc.dart';
import 'package:first_project/Ecommerce/helpers/network/api_endpoint.dart';
import 'package:first_project/Ecommerce/helpers/network/dio_helper.dart';
import 'package:first_project/Ecommerce/home/models/banner_model.dart';
import 'package:first_project/Ecommerce/home/models/product_model.dart';
import 'package:first_project/Ecommerce/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  BannerModel bannerModel = BannerModel();
  List<String> bannerImages = [];

  ProductModel productModel = ProductModel();

  ///---------------Banners -----------------
  void fetchBanners() async {
    emit(HomeBannerLoading());
    final result = await DioHelper.getData(ApiEndPoint.banner);
    bannerModel = BannerModel.fromJson(result.data);
    if (bannerModel.statusCode! < 300) {
      bannerModel.data!.forEach((item) => bannerImages.add(
            item.image!,
          ));
      emit(HomeBannerSuccess());
    } else {
      emit(HomeBannerError());
    }
  }

  ///---------------Products -----------------

  void fetchProducts() async {
    emit(HomeProductLoading());
    final result = await DioHelper.getData(ApiEndPoint.products);
    productModel = ProductModel.fromJson(result.data);

    if (productModel.statusCode! < 300) {
      emit(HomeProductSuccess());
    } else {
      emit(HomeProductError());
    }
  }

  void getProfile() async {
    final result = await DioHelper.getData(ApiEndPoint.profile);
    print(result.data.toString());
    if (result.data["status_code"] == 403) {
      Get.offAll(LoginScreen());
    }
  }
}
