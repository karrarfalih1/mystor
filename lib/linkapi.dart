//فيها جميع روابط الباك ايند

class Applink {
  static const String server = "https://karar.io/ecommerce1";
  static const String test = "$server/test.php";
//====================AUTH=====================//
  static const signUp = "$server/auth/signup.php";
  static const verfiycodesignup = "$server/auth/verfiycode.php";
  static const logIn = "$server/auth/login.php";
  static const reverfiycode = "$server/auth/reverfiycode.php";
//====================forgetpassword=====================//
  static const checkemail = "$server/forgetpassword/checkemail.php";
  static const resetpassword = "$server/forgetpassword/resetpassword.php";
  static const verfiycodeforget = "$server/forgetpassword/verfiycodeforget.php";
//====================home=====================//
  static const home = "$server/home.php";
  static const items = "$server/items/items.php";
  static const search = "$server/items/search.php";

  static const String notification= "$server/notification.php";
///////////////favorite//////////////////
  static const addFavorite = "$server/favorite/add.php";
  static const deletFavorite = "$server/favorite/delet.php";
  static const viewFavorite = "$server/favorite/view.php";
  static const deletfromFavorite = "$server/favorite/deletfromfav.php";
/////////////////////////images//////////////////////
  static const String imagestatic = "https://karar.io/ecommerce1/upload";
  static const String imagescatigores = "$imagestatic/categories";
  static const String imagesitems = "$imagestatic/items";
///////////cart/////////////
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelet = "$server/cart/delet.php";
  static const String cartview = "$server/cart/view.php";
  static const String cartgetcount = "$server/cart/getcountitem.php";
/////////////address/////////////////////
  static const String addressview = "$server/address/view.php";
  static const String addressedit = "$server/address/edit.php";
  static const String addressadd = "$server/address/add.php";
  static const String addressdelet = "$server/address/delet.php";
////////////coupon/////////
  static const String checkcoupon = "$server/coupon/checkcoupon.php";
///////////checkout////////////////
  static const String checkout = "$server/orders/checkout.php";

  
  static const String vieworders = "$server/orders/vieworders.php";
  
  static const String ordersdelet = "$server/orders/delet.php";
  
  static const String ordersdetels = "$server/orders/detels.php";
  
  static const String ordersarchive = "$server/orders/archive.php";
  /////////////offers
  
  static const String offers = "$server/offers.php";
}
