
// const categories = <Category>[
//   Category(
//       id: 0,
//       title: 'Men',
//       image:
//           'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1684146456~exp=1684147056~hmac=d381e4556597ec6c36de52b318a237a44ef1c1c2ee55e8aae1b2fe2b6b56b305'),
//   Category(
//       id: 1,
//       title: 'Women',
//       image:
//           'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=740&t=st=1684146375~exp=1684146975~hmac=f32ca04ecc7207fa8b0269db48cbd6bffeae09c3745db9a74e2cdfea20055144'),
//   Category(
//       id: 2,
//       title: 'Decoration',
//       image:
//           'https://img.freepik.com/free-photo/chic-modern-luxury-aesthetics-style-living-room-gray-tone_53876-132806.jpg?w=740&t=st=1684146650~exp=1684147250~hmac=ec5da67faac001a2ad38c1ffb5795522c8234f7962996b518a365f1ec8efa55d'),
//   Category(
//       id: 3,
//       title: 'Kids',
//       image:
//           'https://img.freepik.com/free-photo/group-primary-schoolers-lying-ground-smiling_53876-138021.jpg?w=996&t=st=1684302271~exp=1684302871~hmac=2fbd64a8231112af6f308ecbe9aa7a5921ef4308e148d0c197253bd391c89dde'),
//   Category(
//       id: 4,
//       title: 'Sport',
//       image:
//           'https://img.freepik.com/free-photo/unrecognisable-basketball-player-looking-away_23-2148393930.jpg?w=740&t=st=1684302363~exp=1684302963~hmac=ccc87484145b201be9f17d5e3a62e388c6f94c206ae1db4291c9c178e2643cd0'),
// ];

// const brands = <Brand>[
//   Brand(
//       id: 0,
//       title: 'Hugo Boss',
//       image: 'assets/images/dummy_images/hugo-boss-logo-png-transparent.png'),
//   Brand(
//       id: 1,
//       title: 'Nike',
//       image: 'assets/images/dummy_images/nike-4-logo-png-transparent.png'),
//   Brand(
//       id: 2,
//       title: 'Adidas',
//       image: 'assets/images/dummy_images/adidas-2-logo-png-transparent.png'),
//   Brand(
//       id: 3,
//       title: 'Gucci',
//       image: 'assets/images/dummy_images/gucci-logo-png-transparent.png'),
//   Brand(
//       id: 4,
//       title: 'Reebok',
//       image: 'assets/images/dummy_images/reebok-logo-png-transparent.png'),
// ];

// const products = <Product>[
//   Product(
//     title: 'Vip shirt',
//     isItemInCart: false,
//     isWishlisted: false,
//     price: 22.00,
//     rating: 4,
//     rated: 21,
//     cartProduct: true,
//     description:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//     images: [
//       Images(
//         originalImageUrl:
//             'https://img.freepik.com/free-psd/mens-tri-blend-crew-tee-mockup_126278-130.jpg?w=740&t=st=1684162184~exp=1684162784~hmac=57a6ab840cfe0f24487d61a4325c41350b8115caa7a86bb29922bdfc0e7afe75',
//       ),
//       Images(
//         originalImageUrl:
//             'https://img.freepik.com/free-psd/chromatees-tshirt-mockup_126278-22.jpg?w=740&t=st=1684165209~exp=1684165809~hmac=d1a7cb2e262874985ba1e42e2a6fb58f1dd08d8cc5d60ae2228478f63a9a2179',
//       ),
//     ],
//   ),
//   Product(
//     title: 'Vip shirt',
//     isItemInCart: false,
//     isWishlisted: true,
//     price: 450.00,
//     isOnSale: true,
//     rating: 4,
//     rated: 21,
//     hasFiles: true,
//     description:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//     images: [
//       Images(
//         originalImageUrl:
//             'https://img.freepik.com/free-psd/chromatees-tshirt-mockup_126278-22.jpg?w=740&t=st=1684165209~exp=1684165809~hmac=d1a7cb2e262874985ba1e42e2a6fb58f1dd08d8cc5d60ae2228478f63a9a2179',
//       ),
//     ],
//   ),
//   Product(
//     title: 'Vip shirt',
//     isItemInCart: true,
//     isWishlisted: true,
//     price: 9000.00,
//     isOnSale: true,
//     rating: 4,
//     rated: 21,
//     description:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//     images: [
//       Images(
//         originalImageUrl:
//             'https://img.freepik.com/free-psd/chromatees-tshirt-mockup_126278-16.jpg?w=740&t=st=1684165303~exp=1684165903~hmac=1cccb2551a39656a751345f07931f56a00516413e7f061d50ee1df517a88c8ce',
//       ),
//     ],
//   ),
// ];

// const carouselImages = <String>[
//   r'assets/images/dummy_images/slider_1.png',
//   r'assets/images/dummy_images/slider_2.png',
//   // r'https://img.freepik.com/free-vector/wooden-hanger-with-paper-message-about-sale-offers_87202-1028.jpg?w=740&t=st=1684164518~exp=1684165118~hmac=a070f2c207e4ab6d5cfe1f4d61ade9e8b46651af6c8d4ff6671cd9ac27bd65d3',
//   // r'https://img.freepik.com/free-vector/modern-outlet-composition-with-flat-design_23-2147973376.jpg?w=740&t=st=1684164530~exp=1684165130~hmac=a889b343371e7fe8de71759908645e8aed83856f911d05a462566f9623f1b266',
//   // r'https://img.freepik.com/free-vector/wooden-hanger-with-paper-message-about-sale-offers_87202-1029.jpg?w=740&t=st=1684164540~exp=1684165140~hmac=a72403664eb8d8f7b4d497505f20cc04105e61d1fad7f6b4d44f9340c490749a'
// ];

final addresses = <String>[
  'Aytakow 68, 92',
  'Chehov 6188, 12',
  'Moskowkiy 652, 5',
];
