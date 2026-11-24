class StringConst {
  static const appTitle = 'Mobile Ecommerce';
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
  static const chooseSize = 'Choose Size';
  static const color = 'Color';
  static const addToCart = 'Add to Cart';
  static const checkout = 'Checkout';
  static const shippingInformation = 'Shipping Information';
  static const maskedCardNumber = '**** **** **** 2143';
  static const subTotal = 'Sub Total';
  static const shippingFee = 'Shipping Fee';
  static const discount = 'Discount';
  static const pay = 'Pay';
  static const favorite = 'Favorite';
  static const profile = 'Profile';
  static const reviewsSuffix = 'reviews';

  static String totalItems(int count) => 'Total ($count items)';

  static String price(double value) => '\$${value.toStringAsFixed(2)}';

  static String reviewLabel(double rating, int count) => '$rating ($count $reviewsSuffix)';
}
