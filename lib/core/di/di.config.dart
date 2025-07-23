// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasource_contract/auth_remote_datasource.dart'
    as _i18;
import '../../features/auth/data/datasource_impl/auth_datasource_impl.dart'
    as _i500;
import '../../features/auth/data/firebase_services/auth_module.dart' as _i846;
import '../../features/auth/data/firebase_services/auth_service.dart' as _i531;
import '../../features/auth/data/firebase_services/auth_service_impl.dart'
    as _i812;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/auth_repo/auth_repo.dart' as _i649;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i1012;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i957;
import '../../features/auth/ui/login/view_model/login_cubit.dart' as _i257;
import '../../features/auth/ui/register/view_model/register_cubit.dart'
    as _i163;
import '../../features/home/layouts/cart_layout/data/datasource_contract/cart_remote_datasource.dart'
    as _i806;
import '../../features/home/layouts/cart_layout/data/datasource_impl/cart_datasource_impl.dart'
    as _i1013;
import '../../features/home/layouts/cart_layout/data/firebase_services/cart_service.dart'
    as _i849;
import '../../features/home/layouts/cart_layout/data/firebase_services/cart_service_impl.dart'
    as _i970;
import '../../features/home/layouts/cart_layout/data/repo_impl/cart_repo_impl.dart'
    as _i417;
import '../../features/home/layouts/cart_layout/domain/repo_contract/cart_repo.dart'
    as _i181;
import '../../features/home/layouts/cart_layout/domain/use_cases/add_to_cart_use_case.dart'
    as _i840;
import '../../features/home/layouts/cart_layout/domain/use_cases/clear_cart_use_case.dart'
    as _i779;
import '../../features/home/layouts/cart_layout/domain/use_cases/delete_from_cart_use_case.dart'
    as _i729;
import '../../features/home/layouts/cart_layout/domain/use_cases/update_cart_use_case.dart'
    as _i1021;
import '../apis/api_error/api_error_handler.dart' as _i439;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final authModule = _$AuthModule();
    gh.lazySingleton<_i439.ApiErrorHandler>(() => _i439.ApiErrorHandler());
    gh.lazySingleton<_i59.FirebaseAuth>(
      () => authModule.firebaseAuthInstance(),
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => authModule.fireStoreInstance(),
    );
    gh.factory<_i531.AuthService>(
      () => _i812.AuthServiceImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i849.CartService>(
      () => _i970.CartServiceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i18.AuthRemoteDataSource>(
      () => _i500.AuthDataSourceImpl(
        gh<_i531.AuthService>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i806.CartRemoteDataSource>(
      () => _i1013.CartRemoteDataSourceImpl(gh<_i849.CartService>()),
    );
    gh.factory<_i649.AuthRepo>(
      () => _i279.AuthRepoImpl(gh<_i18.AuthRemoteDataSource>()),
    );
    gh.factory<_i181.CartRepo>(
      () => _i417.CartRepoImpl(gh<_i806.CartRemoteDataSource>()),
    );
    gh.factory<_i1012.LoginUseCase>(
      () => _i1012.LoginUseCase(gh<_i649.AuthRepo>()),
    );
    gh.factory<_i957.RegisterUseCase>(
      () => _i957.RegisterUseCase(gh<_i649.AuthRepo>()),
    );
    gh.factory<_i779.ClearCartUseCase>(
      () => _i779.ClearCartUseCase(gh<_i181.CartRepo>()),
    );
    gh.factory<_i1021.UpdateCartUseCase>(
      () => _i1021.UpdateCartUseCase(gh<_i181.CartRepo>()),
    );
    gh.factory<_i840.AddToCartUseCase>(
      () => _i840.AddToCartUseCase(gh<_i181.CartRepo>()),
    );
    gh.factory<_i729.DeleteFromCartUseCase>(
      () => _i729.DeleteFromCartUseCase(gh<_i181.CartRepo>()),
    );
    gh.factory<_i163.RegisterCubit>(
      () => _i163.RegisterCubit(gh<_i957.RegisterUseCase>()),
    );
    gh.factory<_i257.LoginCubit>(
      () => _i257.LoginCubit(gh<_i1012.LoginUseCase>()),
    );
    return this;
  }
}

class _$AuthModule extends _i846.AuthModule {}
