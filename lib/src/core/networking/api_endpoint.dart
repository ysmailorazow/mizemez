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
        return '$path/signup/';
      case AuthEndpoint.LOGIN:
        return '$path/login/';
      case AuthEndpoint.BASE:
        return '$path/me';
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String productsRequests(ProductsEndpoint endpoint, {int? id}) {
    const path = '/v1/products';
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
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String placesRequests(PlacesEndpoint endpoint, {int? id}) {
    const path = '/v1/places';
    switch (endpoint) {
      case PlacesEndpoint.BASE:
        return path;
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
    const path = '/v1/categories';
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

  static String commentsRequests(CommentsEndpoint endpoint, {int? id}) {
    const path = '/v1';
    switch (endpoint) {
      case CommentsEndpoint.GET:
        return "$path/get/product/comments";
      case CommentsEndpoint.POST:
        return "$path/create/comment";
      case CommentsEndpoint.GET_CUSTOMER:
        return "$path/get/customer/comments";
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String slidersRequests(SlidersEndpoint endpoint, {int? id}) {
    const path = '/v1/sliders';
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
    const path = '/v1/accounts';
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
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String vendorRequests(VendorEndpoint endpoint, {int? id}) {
    const path = '/v1/account';
    switch (endpoint) {
      case VendorEndpoint.BASE:
        return path;
      case VendorEndpoint.BY_ID:
        {
          assert(id != null, 'vendorsRequestId is required for BY_ID endpoint');
          return '$path/$id';
        }
      case VendorEndpoint.PRODUCTS_BY_ID:
        return '$path/$id/products';
      case VendorEndpoint.DATA_BY_ID:
        return '$path/$id/datas';
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
    const path = '/v1';
    switch (endpoint) {
      case FavouriteEndpoint.BASE:
        return '$path/get/fav';
      case FavouriteEndpoint.REMOVE:
        return '$path/fav/$id';
      case FavouriteEndpoint.ADD:
        return '$path/create/fav';
      case FavouriteEndpoint.EMPTY:
        return '$path/empty';
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String vendorDataRequests(VendorDataEndpoint endpoint, {int? id}) {
    const path = '/v1';
    switch (endpoint) {
      case VendorDataEndpoint.UPDATE:
        return '$path/update/vendor/data';
      case VendorDataEndpoint.BASE:
        return path;
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String myProductsRequests(MyProductsEndpoint endpoint, {int? id}) {
    const path = '/v1/my-products';
    switch (endpoint) {
      case MyProductsEndpoint.BASE:
        return path;
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String messagesRequests(MessagesEndpoint endpoint, {int? id}) {
    const path = '/v1/messages';
    switch (endpoint) {
      case MessagesEndpoint.BASE:
        return path;
      case MessagesEndpoint.INIT:
        return '$path/initialize-chatting/$id';
      case MessagesEndpoint.CHATROOM:
        return '$path/$id';
      case MessagesEndpoint.CHATROOM_PAGINATE:
        return '$path/chatroom/$id/load-more';
    }
  }

  /// Returns the path for a hangout request [endpoint].
  ///
  /// Specify hangout request [id] to get the path for a specific hangout request.
  static String notificationsRequests(NotificationsEndpoint endpoint,
      {int? id}) {
    const path = '/v1/notifications';
    switch (endpoint) {
      case NotificationsEndpoint.BASE:
        return path;
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

  SEARCH,
}

enum PlacesEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,
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

enum MyProductsEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,
}

enum MessagesEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,

  INIT,

  CHATROOM,

  CHATROOM_PAGINATE,
}

enum NotificationsEndpoint {
  /// An endpoint for news requests' collection requests.
  BASE,
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

enum VendorEndpoint {
  BASE,

  BY_ID,

  PRODUCTS_BY_ID,

  DATA_BY_ID,
}

enum VendorDataEndpoint {
  BASE,

  UPDATE,
}

enum CommentsEndpoint { GET, POST, GET_CUSTOMER }
