//فيها جميع روابط الباك ايند




class Applink {                          
static const String server="https://karar.io/ecommerce1";

static const String test="$server/test.php";
//====================AUTH=====================//
static const signUp ="$server/auth/signup.php";
static const verfiycodesignup ="$server/auth/verfiycode.php";
static const logIn ="$server/auth/login.php";
static const reverfiycode ="$server/auth/reverfiycode.php";
//====================forgetpassword=====================//
static const checkemail ="$server/forgetpassword/checkemail.php";
   static const resetpassword ="$server/forgetpassword/resetpassword.php";
static const verfiycodeforget ="$server/forgetpassword/verfiycodeforget.php";
//====================home=====================//
static const home="$server/home.php";
static const items="$server/items/items.php";
///////////////favorite//////////////////

static const addFavorite ="$server/favorite/add.php";
static const deletFavorite ="$server/favorite/delet.php";
static const viewFavorite ="$server/favorite/view.php";
static const deletfromFavorite ="$server/favorite/deletfromfav.php";
                                   
/////////////////////////images//////////////////////
static const String imagestatic="https://karar.io/ecommerce1/upload";
static const String imagescatigores="$imagestatic/categories";
static const String imagesitems="$imagestatic/items";

}