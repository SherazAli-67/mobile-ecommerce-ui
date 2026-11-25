class StringConst {
  static const appTitle = 'Mobile Ecommerce';
  static const appFontFamily = 'Outfit';
  static const helloWelcome = 'Hello, Welcome 👋';
  static const userName = 'Albert Stevano';
  static const searchClothesHint = 'Search clothes. . .';
  static const categoryAllItems = 'All Items';
  static const categoryDress = 'Dress';
  static const categoryTshirt = 'T-Shirt';
  static const categoryJeans = 'Jeans';
  static const dressModern = 'Dress modern';
  static const productModernLightClothes = 'Modern Light Clothes';
  static const productLightDressBless = 'Light Dress Bless';
  static const productMaroonDarkTop = 'Maroon Dark Top';
  static const productLightDressYellow = 'Light Dress Yellow';
  static const productDescription = 'Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes';
  static const readMore = 'Read More. . .';
  static const readLess = 'Read Less';
  static const chooseSize = 'Choose Size';
  static const color = 'Color';
  static const addToCart = 'Add to Cart';
  static const checkout = 'Checkout';
  static const shippingInformation = 'Shipping Information';
  static const maskedCardPrefix = '**** **** **** ';
  static const maskedCardLastFour = '2143';
  static const maskedCardNumber = '$maskedCardPrefix$maskedCardLastFour';

  static const subTotal = 'Sub Total';
  static const shippingFee = 'Shipping Fee';
  static const discount = 'Discount';
  static const pay = 'Pay';
  static const favorite = 'Favorite';
  static const profile = 'Profile';
  static const reviewsSuffix = 'reviews';

  static String totalItems(int count) => 'Total ($count items)';

  static String price(double value) {
    final parts = value.toStringAsFixed(2).split('.');
    final digits = parts[0];
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
      buffer.write(digits[i]);
    }
    return '\$$buffer.${parts[1]}';
  }

  static String reviewLabel(double rating, int count) => '$rating ($count $reviewsSuffix)';

  static String addToCartLabel(double value) => '$addToCart | ${price(value)}';

  static String formattedReviews(int count) {
    if (count < 1000) return '($count $reviewsSuffix)';
    final thousands = count ~/ 1000;
    final rest = (count % 1000).toString().padLeft(3, '0');
    return '($thousands.$rest $reviewsSuffix)';
  }
}
