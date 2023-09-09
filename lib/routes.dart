import 'package:alfalPay/Views/Client/Bills/bills_screen.dart';
import 'package:alfalPay/Views/Client/History/history_screen.dart';
import 'package:alfalPay/Views/Client/Agents/agents_screen.dart';
import 'package:alfalPay/Views/Client/Home/currency_screen.dart';
import 'package:alfalPay/Views/Client/Hewala/hewala_screen.dart';
import 'package:alfalPay/Views/Client/Home/home_screen.dart';
import 'package:alfalPay/Views/Client/Home/trans_qr_scanner.dart';
import 'package:alfalPay/Views/Client/Home/transfer_screen.dart';
import 'package:alfalPay/Views/Client/Profile/edit_screen.dart';
import 'package:alfalPay/Views/Client/Profile/password_update_screen.dart';
import 'package:alfalPay/Views/Client/Profile/profile_screen.dart';
import 'package:get/get.dart';
import 'Util/Middlewares/middleware.dart';
import 'Views/Auth/intro_screen.dart';
import 'Views/Auth/login_screen.dart';
import 'Views/Auth/onBoarding_screen.dart';
import 'Views/Auth/otp_screen.dart';
import 'Views/Auth/register_screen.dart';
import 'Views/Auth/resetpass_screen.dart';
import 'Views/Auth/splash_screen.dart.dart';
import 'Views/Auth/welcome_screen.dart';

/// Routes name to directly navigate the route by its name
class Routes {
  static String splash = '/';
  static String intro = '/intro';
  static String obBoarding = '/onBoarding';
  static String welcome = '/welcome';
  static String login = '/login';
  static String register = '/register';
  static String reset = '/reset';
  static String edit = '/edit';
  static String passwordUpdate = '/passwordUpdate';
  static String otp = '/otp';
  static String home = '/home';
  static String profile = '/profile';
  static String history = '/history';
  static String ticket = '/ticket';
  static String transfer = '/transfer';
  static String qrScanner = '/qr';
  static String agents = '/agents';
  static String currency = '/currency';
  static String bills = '/bills';
  static String hewala = '/hewala';
}

List<GetPage<dynamic>> routes = [
  GetPage(name: Routes.splash, page: () => const SplashScreen()),
  GetPage(
    name: Routes.intro,
    page: () => const IntroScreen(),
    middlewares: [MiddleWare()],
  ),
  GetPage(name: Routes.obBoarding, page: () => const OnBoardingScreen()),
  GetPage(name: Routes.welcome, page: () => const WelcomeScreen()),
  GetPage(
    name: Routes.login,
    page: () => const LoginScreen(),
    //middlewares: [LoginMiddleWare()],
  ),
  GetPage(name: Routes.register, page: () => const RegisterScreen()),
  GetPage(name: Routes.edit, page: () => const EditScreen()),
  GetPage(
      name: Routes.passwordUpdate, page: () => const PasswordUpdateScreen()),
  GetPage(name: Routes.reset, page: () => const ResetPassScreen()),
  GetPage(name: Routes.otp, page: () => const OTPScreen()),
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(name: Routes.profile, page: () => const ProfileScreen()),
  GetPage(name: Routes.history, page: () => HistoryScreen()),
  //GetPage(name: Routes.ticket, page: () => TicketScreen()),
  GetPage(name: Routes.transfer, page: () => TransferScreen()),
  GetPage(name: Routes.qrScanner, page: () => const TransferQR()),
  GetPage(name: Routes.agents, page: () => const AgentsScreen()),
  GetPage(name: Routes.currency, page: () => const CurrencyRates()),
  GetPage(name: Routes.bills, page: () => const BillsScreen()),
  GetPage(name: Routes.hewala, page: () => HewalaScreen()),
  // GetPage(
  //     name: Routes.product, page: () => ProductScreen(product: Get.arguments)),
];
