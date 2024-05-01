// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';

import '../../core/globals.dart';

/// A utility class for getting paths for API endpoints.
/// This class has no constructor and all methods are `static`.
@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  /// The base url of our REST API, to which all the requests will be sent.
  /// It is supplied at the time of building the apk or running the app:
  /// ```
  /// flutter build apk --debug --dart-define=BASE_URL=www.some_url.com
  /// ```
  /// OR
  /// ```
  /// flutter run --dart-define=BASE_URL=www.some_url.com
  /// ```
  static const baseUrl = Configs.baseUrl;

  /// Returns the path for an authentication [endpoint].
  static String auth(AuthEndpoint endpoint) {
    const path = '';
    switch (endpoint) {
      case AuthEndpoint.REGISTER:
        return '$path/customer/register/';
      case AuthEndpoint.LOGIN:
        return '$path/customer/login/';
      case AuthEndpoint.BASE:
        return '$path/v1/customer/get';
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String productsRequests(ProductsEndpoint endpoint, {int? id}) {
    const path = '/products';
    switch (endpoint) {
      case ProductsEndpoint.BASE:
        return path;
      case ProductsEndpoint.BY_ID:
        {
          assert(
              id != null, 'productsRequestId is required for BY_ID endpoint');
          return '$path/$id';
        }
      case ProductsEndpoint.SEARCH:
        return '$path-search';
      case ProductsEndpoint.RELATED:
        return '$path/related/$id';
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String descendantCategoriesRequests(
      DescendantCategoriesEndpoint endpoint,
      {int? id}) {
    const path = '/descendant-categories';
    switch (endpoint) {
      case DescendantCategoriesEndpoint.BASE:
        return path;
      case DescendantCategoriesEndpoint.BY_ID:
        {
          assert(
              id != null, 'categoriesRequestId is required for BY_ID endpoint');
          return '$path/$id';
        }
    }
  }

  static String categoriesRequests(CategoriesEndpoint endpoint, {int? id}) {
    const path = '/categories';
    switch (endpoint) {
      case CategoriesEndpoint.BASE:
        return path;
      case CategoriesEndpoint.BY_ID:
        {
          assert(
              id != null, 'categoriesRequestId is required for BY_ID endpoint');
          return '$path/$id';
        }
      case CategoriesEndpoint.FILTERS:
        {
          assert(id != null,
              'categoriesRequestId is required for FILTERS endpoint');
          return '$path/$id/filters';
        }
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String slidersRequests(SlidersEndpoint endpoint, {int? id}) {
    const path = '/sliders';
    switch (endpoint) {
      case SlidersEndpoint.BASE:
        return path;
      case SlidersEndpoint.BY_ID:
        {
          assert(
              id != null, 'categoriesRequestId is required for BY_ID endpoint');
          return '$path/$id';
        }
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String addressesRequests(AddressesEndpoint endpoint, {int? id}) {
    const path = '/customer/addresses';
    switch (endpoint) {
      case AddressesEndpoint.BASE:
        return path;
      case AddressesEndpoint.BY_ID:
        {
          assert(
              id != null, 'categoriesRequestId is required for BY_ID endpoint');
          return '$path/$id';
        }
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String vendorsRequests(VendorsEndpoint endpoint, {int? id}) {
    const path = '/vendors';
    switch (endpoint) {
      case VendorsEndpoint.BASE:
        return path;
      case VendorsEndpoint.BY_ID:
        {
          assert(id != null, 'vendorsRequestId is required for BY_ID endpoint');
          return '$path/$id';
        }
    }
  }

  /// Returns the path for a hangout request [endpoint].
  static String homeRequests(HomeEndpoint endpoint) {
    const path = '/home';
    switch (endpoint) {
      case HomeEndpoint.BASE:
        return path;
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String cartRequests(CartEndpoint endpoint, {int? id}) {
    const path = '/customer/cart';
    switch (endpoint) {
      case CartEndpoint.BASE:
        return path;
      case CartEndpoint.REMOVE:
        return '$path/remove/$id';
      case CartEndpoint.ADD:
        return '$path/add/$id';
      case CartEndpoint.EMPTY:
        return '$path/empty';
      case CartEndpoint.UPDATE:
        return '$path/update';
      case CartEndpoint.COUPON:
        return '$path/coupon';
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String checkoutRequests(CheckoutEndpoint endpoint, {int? id}) {
    const path = '/customer/checkout';
    switch (endpoint) {
      case CheckoutEndpoint.BASE:
        return path;
      case CheckoutEndpoint.SAVE_SHIPPING:
        return '$path/save-shipping';
      case CheckoutEndpoint.SAVE_PAYMENT:
        return '$path/save-payment';
      case CheckoutEndpoint.SAVE_ORDER:
        return '$path/save-order';
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String ordersRequest(MyOrdersEndpoint endpoint, {int? id}) {
    const path = '/customer/orders';
    switch (endpoint) {
      case MyOrdersEndpoint.BASE:
        return path;
      case MyOrdersEndpoint.BY_ID:
        return '$path/$id';
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String favouriteRequests(FavouriteEndpoint endpoint, {int? id}) {
    const path = '/customer/wishlist';
    switch (endpoint) {
      case FavouriteEndpoint.BASE:
        return path;
      case FavouriteEndpoint.REMOVE:
        return '$path/$id';
      case FavouriteEndpoint.ADD:
        return '$path/$id';
      case FavouriteEndpoint.EMPTY:
        return '$path/empty';
    }
  }
}

/// A collection of endpoints used for authentication purposes.
enum AuthEndpoint {
  BASE,

  /// An endpoint for registration requests.
  REGISTER,

  /// An endpoint for login requests.
  LOGIN,
}

enum HomeEndpoint {
  BASE,
}

enum ProductsEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,

  /// An endpoint for single news request's requests.
  BY_ID,

  // VENDOR,

  // VENDOR_BY_ID,

  SEARCH,

  RELATED,
}

enum SlidersEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,

  /// An endpoint for single news request's requests.
  BY_ID,
}

enum CompaniesEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,

  /// An endpoint for single news request's requests.
  BY_ID,
}

enum CartEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,

  REMOVE,

  ADD,

  EMPTY,

  UPDATE,

  COUPON,
}

enum CheckoutEndpoint {
  BASE,

  SAVE_SHIPPING,

  SAVE_PAYMENT,

  SAVE_ORDER,
}

enum FavouriteEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,

  REMOVE,

  ADD,

  EMPTY,
}

enum DescendantCategoriesEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,

  /// An endpoint for single news request's requests.
  BY_ID,
}

enum CategoriesEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,

  /// An endpoint for single news request's requests.
  BY_ID,

  FILTERS,
}

enum VendorsEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,

  /// An endpoint for single news request's requests.
  BY_ID,
}

enum AddressesEndpoint {
  BASE,

  BY_ID,
}

enum MyOrdersEndpoint {
  BASE,

  BY_ID,
}
