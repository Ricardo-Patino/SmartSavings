import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // settings
  {
    '2l9eplby': {
      'en': 'Settings',
      'es': 'Ajustes',
    },
    'z6l4z05o': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    '3s07hbqc': {
      'en': 'Contact',
      'es': 'Contacto',
    },
    'vvmk5cft': {
      'en': 'Choose language',
      'es': 'Elija el idioma',
    },
    'mclatdop': {
      'en': 'Reset password',
      'es': 'Restablecer contraseña',
    },
    'rs270oa8': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
    },
    '0x9bn4uq': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
    },
    'ayj7zciz': {
      'en': 'Do you really want to get out of SmartSavings?',
      'es': '¿De verdad quieres salir de SmartSavings?',
    },
    'u77kd0xv': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'x1zlnj43': {
      'en': 'Confirm',
      'es': 'Confirmar',
    },
    'd3mknvvt': {
      'en': 'Settings',
      'es': 'Ajustes',
    },
  },
  // login
  {
    'qggdbtg4': {
      'en': 'SmartSavings',
      'es': 'Smart\$avings',
    },
    'kxiutu7a': {
      'en': 'Create Account',
      'es': 'Crear Cuenta',
    },
    '8onoh62b': {
      'en': 'Create Account',
      'es': 'Crear Cuenta',
    },
    'amao6idu': {
      'en':
          'Get started by creating your account manage on multiple devices anytime! ',
      'es':
          '¡Empieza creando tu cuenta y administrándola en múltiples dispositivos en cualquier momento!',
    },
    'j4h5pupr': {
      'en': '',
      'es': '',
    },
    'mb5anmnv': {
      'en': 'Username',
      'es': 'Dirección de correo electrónico',
    },
    'p15p750c': {
      'en': '',
      'es': '',
    },
    '1fjmbvvf': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    'zg9lf0t9': {
      'en': '',
      'es': '',
    },
    'iajef66l': {
      'en': 'Birthday mm/dd/yyyy',
      'es': 'Cumpleaños mm/dd/aaaa',
    },
    '9ybs2d9b': {
      'en': '',
      'es': '',
    },
    'rfbjtp50': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'vitb1fib': {
      'en': '',
      'es': '',
    },
    'nlhmj3yq': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
    },
    '4ibkmwx7': {
      'en': 'Create Account',
      'es': 'Crear Cuenta',
    },
    'u6qfqqol': {
      'en': 'Log In',
      'es': 'Log In',
    },
    'czaqm8sx': {
      'en': 'Welcome Back',
      'es': 'Bienvenido de nuevo',
    },
    'x1mua2l2': {
      'en': 'Fill out the information below in order to access your account.',
      'es': 'Complete la siguiente información para acceder a su cuenta.',
    },
    'iav3i6c0': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    '2y8wc9zo': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    '99va8wxa': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
    },
    '304zjoo9': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    '3jpxqy42': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Profile
  {
    'rs7yh16p': {
      'en': 'Account Settings',
      'es': 'Configuraciones de la cuenta',
    },
    'elvretnm': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    '2s8zrlwh': {
      'en': 'NickName',
      'es': 'Apodo',
    },
    '0d1v9kr8': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    '99xxfrbs': {
      'en': 'Current Password',
      'es': 'Contraseña actual',
    },
    '8qll5tyo': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
    },
    'xjmzqozk': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
    },
    'l9454a6n': {
      'en': 'Confirm New Password',
      'es': 'Confirmar nueva contraseña',
    },
    'e7q5nec8': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
    },
    'knm3nxlj': {
      'en': 'Save',
      'es': 'Ahorrar',
    },
    '2e4ialf9': {
      'en': 'Delete Account',
      'es': 'Eliminar cuenta',
    },
    '31b6ggmn': {
      'en': 'Nickname is required',
      'es': 'Se requiere apodo',
    },
    '6sq9t25i': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'zpx5g2wa': {
      'en': 'email is required',
      'es': 'Se requiere correo electrónico',
    },
    'q1splfu8': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'c8jvl7u2': {
      'en': 'Password is required',
      'es': 'Se requiere contraseña',
    },
    'wkzyl9xe': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'cjfilet9': {
      'en': 'Password must match',
      'es': 'La contraseña debe coincidir',
    },
    'a4vjl3yu': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    '6mixe71d': {
      'en': 'Confirm Password is required',
      'es': 'Confirmar contraseña es requerido',
    },
    '2yq8hqeb': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'apxdysql': {
      'en': 'User´s Profile',
      'es': 'Perfil del usuario',
    },
    'm3e43j1h': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // ForgotPassword
  {
    'yye6rchf': {
      'en': 'Recover your Account',
      'es': 'Recupera tu cuenta',
    },
    'glv2fwtw': {
      'en': 'Account Recovery',
      'es': 'Recuperación de cuenta',
    },
    '57y9rke6': {
      'en': 'Recover your Account',
      'es': 'Recupera tu cuenta',
    },
    'aw6f1y64': {
      'en':
          'Enter your email address to receive an email containing a temporary password',
      'es':
          'Introduzca su dirección de correo electrónico para recibir un correo electrónico con una contraseña temporal',
    },
    'uo61elkz': {
      'en': '',
      'es': '',
    },
    '3jbxtckn': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    '0wbdnkmn': {
      'en': 'Reset Password',
      'es': 'Enviar contraseña',
    },
    'bstwbuvq': {
      'en': 'Not an active user? Sign up.',
      'es': '¿No eres un usuario activo? Regístrate.',
    },
    '16dr7ewz': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    '7byge8vi': {
      'en': 'Recover Account',
      'es': 'Recuperar cuenta',
    },
  },
  // MainPage
  {
    'ghny3a8m': {
      'en': 'Main Page',
      'es': 'Página principal',
    },
    'gle631lq': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
    },
    'pbq9hyue': {
      'en': 'Do you really want to get out of SmartSavings?',
      'es': '¿De verdad quieres salir de SmartSavings?',
    },
    'eet03gpf': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '2qbcc2js': {
      'en': 'Confirm',
      'es': 'Confirmar',
    },
    'qwivjl3x': {
      'en': 'SmartSavings',
      'es': '',
    },
    'hes8elfq': {
      'en': 'Budget',
      'es': 'Presupuesto',
    },
    'pokpgbki': {
      'en': 'Categories',
      'es': 'Categorías',
    },
    'ciopx9q0': {
      'en': 'Register Transation',
      'es': 'Registrar Transacción',
    },
    '489bv5vf': {
      'en': 'Savings Goals',
      'es': 'Metas de Ahorro',
    },
    'iqkqu7v4': {
      'en': 'Statistics',
      'es': 'Estadísticas e informes',
    },
    'iiyrc3bk': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CategoriaPage
  {
    'm7aautrm': {
      'en': 'Categories',
      'es': 'Categorías',
    },
    '3ojlu2k2': {
      'en': 'SmartSavings',
      'es': '',
    },
    '78aqpwvh': {
      'en': 'Create Category',
      'es': 'Crear una categoría',
    },
    'km7bkpuz': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CrearCategoriaPage
  {
    'b6yfi4jy': {
      'en': 'SmartSavings',
      'es': '',
    },
    'qiaafl4j': {
      'en': 'Name',
      'es': 'Nombre',
    },
    'fa1x0kh3': {
      'en': 'Name',
      'es': 'Nombre',
    },
    'vozrptl0': {
      'en': 'Percentage',
      'es': 'Porcentaje',
    },
    'zwzvf8zh': {
      'en': 'Used Percentage',
      'es': 'Porcentaje usado',
    },
    'za256662': {
      'en': 'Color',
      'es': 'Color',
    },
    '0w28gbwg': {
      'en': 'Select.',
      'es': 'Seleccionar.',
    },
    '4jmikidz': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'klgbcsxe': {
      'en': 'Red',
      'es': 'Rojo',
    },
    'ndb9d8pa': {
      'en': 'Green',
      'es': 'Verde',
    },
    'a6mzulwf': {
      'en': 'Yellow',
      'es': 'Amarillo',
    },
    'd3hz1xvz': {
      'en': 'Blue',
      'es': 'Azul',
    },
    'nxwscjm0': {
      'en': 'Grey',
      'es': 'Gris',
    },
    'w42enfyi': {
      'en': 'Name is required',
      'es': 'El nombre es obligatorio',
    },
    'vt90osm8': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    '32pd6p3p': {
      'en': 'Used Percentage is required',
      'es': 'Se requiere el porcentaje usado',
    },
    'vp2jka42': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    '2948cd55': {
      'en': 'Create Category',
      'es': 'Crear categoría',
    },
    'ar6aybgb': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '602ox0fn': {
      'en': 'Create Categories',
      'es': 'Crear categorías',
    },
    'u7bbj4hw': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // EditarCategoriaPage
  {
    'rd0agjk3': {
      'en': 'SmartSavings',
      'es': '',
    },
    's726lfh5': {
      'en': 'Name',
      'es': 'Nombre',
    },
    'z0529trb': {
      'en': 'Name',
      'es': 'Nombre',
    },
    'iy9s5a4n': {
      'en': 'Percentage',
      'es': 'Porcentaje',
    },
    'iftau0uw': {
      'en': 'Used Percentage',
      'es': 'Porcentaje usado',
    },
    'hs6fgotm': {
      'en': 'Color',
      'es': 'Color',
    },
    '75kqdyhm': {
      'en': 'Select',
      'es': 'Seleccionar',
    },
    'w3o4844w': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '4j23yr0b': {
      'en': 'Red',
      'es': 'Rojo',
    },
    'y9gszw9w': {
      'en': 'Green',
      'es': 'Verde',
    },
    'bt0k2c3b': {
      'en': 'Yellow',
      'es': 'Amarillo',
    },
    'rwxt0ak6': {
      'en': 'Blue',
      'es': 'Azul',
    },
    'p45psbt7': {
      'en': 'Grey',
      'es': 'Gris',
    },
    '53vrqsjd': {
      'en': 'Edit  Category',
      'es': 'Editar categoría',
    },
    'avq7q6gk': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'uxiky8qi': {
      'en': 'Edit  Categories',
      'es': 'Editar Categorías',
    },
    'vr15lact': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // TransaccionPage
  {
    'ijjmto58': {
      'en': 'SmartSavings',
      'es': '',
    },
    'scer8xjf': {
      'en': 'Create transaction',
      'es': 'Crear transacción',
    },
    'os8b4ogr': {
      'en': 'Transactions',
      'es': 'Transacciones',
    },
    'uncw6xni': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CrearTransaccionPage
  {
    'b04t1fq4': {
      'en': 'SmartSavings',
      'es': '',
    },
    'dmfu4gdt': {
      'en': 'Amount',
      'es': 'Monto',
    },
    'dll99w07': {
      'en': 'Amount',
      'es': 'Monto',
    },
    'xasb01kj': {
      'en': 'Description',
      'es': 'Descripción',
    },
    'jwgee9dw': {
      'en': 'Description',
      'es': 'Descripción',
    },
    '6dbyffc8': {
      'en': 'Categorie',
      'es': 'Categoría',
    },
    'gyvyb1pt': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'km14q4hy': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'ilr9bm0y': {
      'en': 'Type',
      'es': 'Tipo',
    },
    '4ea4cp2z': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    '0i4500zt': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'cazrd0kr': {
      'en': 'Earning',
      'es': 'Ingreso',
    },
    'hekxrnfo': {
      'en': 'Bill',
      'es': 'Salida',
    },
    'igmu24f6': {
      'en': 'Currency',
      'es': 'Moneda',
    },
    'jhw8mrgk': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'mf9lzcf5': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'oaq36dat': {
      'en': 'CRC',
      'es': 'CRC',
    },
    'ocgz2uo6': {
      'en': 'USD',
      'es': 'USD',
    },
    'tyncyyo5': {
      'en': 'Pay Method',
      'es': 'MétodoPago',
    },
    'g5gk33tp': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'zpjz515t': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'gu13x14z': {
      'en': 'Cash',
      'es': 'Efectivo',
    },
    'ijhwi7la': {
      'en': 'Card',
      'es': 'Tarjeta',
    },
    'aavy0uxb': {
      'en': 'Transfer',
      'es': 'Transferencia',
    },
    '2ux71mu5': {
      'en': 'Sinpe',
      'es': 'Sinpe',
    },
    'pnmgdlmd': {
      'en': 'State',
      'es': 'Estado',
    },
    'xnrmotet': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    '2k8dw3b1': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '4cqkedyf': {
      'en': 'Pending',
      'es': 'Pendiente',
    },
    '3idowgza': {
      'en': 'Canceled',
      'es': 'Cancelado',
    },
    '9n08rm22': {
      'en': 'Amount is required',
      'es': 'Se requiere cantidad',
    },
    'w3799lyw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'y6uner4h': {
      'en': 'Description required',
      'es': 'Descripción requerida',
    },
    'oxm8vi24': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    '6z52fg0u': {
      'en': 'Create transaction',
      'es': 'Crear transacción',
    },
    '088rg041': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '6q78m2ev': {
      'en': 'Create transaction',
      'es': 'Crear transacción',
    },
    '7bxj4lnw': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Estadisticas
  {
    'c0ax7k2b': {
      'en': 'Monthly Summary',
      'es': 'Resumen mensual',
    },
    'kx7nk5nm': {
      'en': 'Historical',
      'es': 'Histórico',
    },
    'wfbp2b13': {
      'en': 'Statistics and Reports',
      'es': 'Estadísticas y Reportes',
    },
    'qjo5jlrb': {
      'en': 'Statistics',
      'es': 'Hogar',
    },
  },
  // ResumenMensual
  {
    '9oqghfaz': {
      'en': 'Date',
      'es': 'Fecha',
    },
    'fdj3m0pw': {
      'en': 'Amount',
      'es': 'Monto',
    },
    'j1g286dt': {
      'en':
          'This chart shows information about transaction dates and amounts for the current month.',
      'es':
          'Este gráfico muestra información sobre las fechas y los montos de las transacciones del mes actual.',
    },
    'fg40umyx': {
      'en': 'Monthly Summary',
      'es': 'Resumen mensual',
    },
    '0w4dx888': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ResumenHistorico
  {
    'm57r2bb3': {
      'en': 'Date',
      'es': 'Fecha',
    },
    '1nukmxia': {
      'en': 'Amount',
      'es': 'Monto',
    },
    'ecahpql1': {
      'en':
          'This chart shows information about transaction dates and amounts from the start date to the current date.',
      'es':
          'En este gráfico se muestra la información sobre las fechas de las transacciones y el monto desde el inicio hasta la fecha actual.',
    },
    'a90a3rnh': {
      'en': 'Historical Summary',
      'es': 'Resumen Histórico',
    },
    'cjdeuzi9': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // MetasAhorro
  {
    '8ntertnt': {
      'en': 'Metas de Ahorro',
      'es': 'Metas de Ahorro',
    },
    'gjzxj8bo': {
      'en': 'SmartSavings',
      'es': '',
    },
    'ewytv51a': {
      'en': 'Create Goal',
      'es': 'Crear Metas',
    },
    'z5t3r4di': {
      'en': 'Active Goals',
      'es': 'Metas Activas',
    },
    '3g9a81nt': {
      'en': 'Goals Accomplished',
      'es': 'Metas cumplidas',
    },
    'av1n96x9': {
      'en': 'All Goals',
      'es': 'Todas las Metas',
    },
    'djnluawr': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // editarTransaccionPage
  {
    '8varpm4v': {
      'en': 'SmartSavings',
      'es': '',
    },
    '2s0omiez': {
      'en': 'Amount',
      'es': 'Monto',
    },
    'lojpc4m0': {
      'en': 'Amount',
      'es': 'Monto',
    },
    'pwed4mpx': {
      'en': 'Description',
      'es': 'Descripción',
    },
    'x9zy4a7j': {
      'en': 'Description',
      'es': 'Descripción',
    },
    'epv57tqz': {
      'en': 'Categorie',
      'es': 'Categoría',
    },
    '2e63xcjy': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    '2vixusmh': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'nzu9odbw': {
      'en': 'Type',
      'es': 'Tipo',
    },
    'pj2ehn7g': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'o9lo9lgj': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '7kt3tjlj': {
      'en': 'Earning',
      'es': 'Ingreso',
    },
    'k1q19raw': {
      'en': 'Bill',
      'es': 'Salida',
    },
    'nlzbgh48': {
      'en': 'Currency',
      'es': 'Moneda',
    },
    '0kapg03n': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    '3o20rs6y': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'rep3pbb7': {
      'en': 'CRC',
      'es': 'CRC',
    },
    'in1s9pl5': {
      'en': 'USD',
      'es': 'USD',
    },
    'c50l53zz': {
      'en': 'Pay Method',
      'es': 'MétodoPago',
    },
    'z8cfv66v': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'gz12bsja': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'pk0jobe9': {
      'en': 'Cash',
      'es': 'Efectivo',
    },
    '041z7dqj': {
      'en': 'Card',
      'es': 'Tarjeta',
    },
    'u06wlkxs': {
      'en': 'Transfer',
      'es': 'Transferencia',
    },
    'tz5c6y45': {
      'en': 'Sinpe',
      'es': 'Sinpe',
    },
    '7ta1bdrv': {
      'en': 'State',
      'es': 'Estado',
    },
    'lze5xu5i': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'mj3or1vr': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'k6d6dowh': {
      'en': 'Pending',
      'es': 'Pendiente',
    },
    '887p035h': {
      'en': 'Canceled',
      'es': 'Cancelado',
    },
    'skb28ehs': {
      'en': 'Amount is required',
      'es': 'Se requiere cantidad',
    },
    '0twsvhsu': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'eiz9mx69': {
      'en': 'Description required',
      'es': 'Descripción requerida',
    },
    '0cpu4dki': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'xz82elow': {
      'en': 'Edit transaction',
      'es': 'Editar transacción',
    },
    '26bfswv8': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '43adhyjn': {
      'en': 'Edit transaction',
      'es': 'Editar transacción',
    },
    'b2kltpsr': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PresupuestoPage
  {
    '4kud5zzx': {
      'en': 'SmartSavings',
      'es': '',
    },
    'tkz6qevh': {
      'en': 'Create budget',
      'es': 'Crear transacción',
    },
    'f9icxmp1': {
      'en': 'Budget',
      'es': 'Transacciones',
    },
    'mpya2u3q': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // createPresupuestoPage
  {
    'j7ki00uv': {
      'en': 'SmartSavings',
      'es': '',
    },
    'cjb9frs9': {
      'en': 'Categorie',
      'es': 'Categoría',
    },
    '1oo12sy8': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'o8dqn1us': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '4eu8q9e9': {
      'en': 'Period',
      'es': 'Período',
    },
    '9klp9ohg': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'sau6zfei': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'bayy10p5': {
      'en': 'January',
      'es': 'Enero',
    },
    '1i112c5p': {
      'en': 'February',
      'es': 'Febrero',
    },
    '83wrj079': {
      'en': 'March',
      'es': 'Marzo',
    },
    'a9k2euwe': {
      'en': 'April',
      'es': 'Abril',
    },
    '5ar9culj': {
      'en': 'May',
      'es': 'Mayo',
    },
    '6u266p5f': {
      'en': 'June',
      'es': 'Junio',
    },
    'qv1a284s': {
      'en': 'July',
      'es': 'Julio',
    },
    '51yf63cn': {
      'en': 'August',
      'es': 'Agosto',
    },
    'ixgpvpt5': {
      'en': 'September',
      'es': 'Setiembre',
    },
    'k9pt1f05': {
      'en': 'October',
      'es': 'Octubre',
    },
    '1tag8u4c': {
      'en': 'November',
      'es': 'Noviembre',
    },
    'wm4ll73t': {
      'en': 'December',
      'es': 'Diciembre',
    },
    '84iibysb': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'tu4465bg': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'sfz7yjpl': {
      'en': '2025',
      'es': '2025',
    },
    'bxl9csam': {
      'en': '2026',
      'es': '2026',
    },
    '4vi3aroc': {
      'en': '2027',
      'es': '2027',
    },
    'cx0n6nmv': {
      'en': '2028',
      'es': '2028',
    },
    'uoptwz9d': {
      'en': '2029',
      'es': '2029',
    },
    'x7qvs115': {
      'en': '2030',
      'es': '2030',
    },
    'woo55w4p': {
      'en': 'Currency',
      'es': 'Moneda',
    },
    'zz1yu8jw': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    '314ukzkh': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '3s5memqo': {
      'en': 'CRC',
      'es': 'CRC',
    },
    'c6u93uun': {
      'en': 'USD',
      'es': 'USD',
    },
    'ty1o7kg4': {
      'en': 'Limit',
      'es': 'Límite',
    },
    'awvjdpg4': {
      'en': 'Limit',
      'es': 'Límite',
    },
    '27egj90s': {
      'en': 'Limit is required',
      'es': 'Se requiere límite',
    },
    'y6xptgi7': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'isp9i1eq': {
      'en': 'Create budget',
      'es': 'Crear presupuesto',
    },
    'xa1p6p09': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'elk6e804': {
      'en': 'Create Budget',
      'es': 'Crear presupuesto',
    },
    't4a5egmx': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // editarPresupuestoPage
  {
    'qzx2mox0': {
      'en': 'SmartSavings',
      'es': '',
    },
    'lre76e3v': {
      'en': 'Categorie',
      'es': 'Categoria',
    },
    't6vy0hb6': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'jm9wyulv': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'nhb6ey68': {
      'en': 'Period',
      'es': 'Período',
    },
    'yt4dkpn9': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    '199slkge': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'kd1uhtq7': {
      'en': 'January',
      'es': 'Enero',
    },
    'wtdg6ix9': {
      'en': 'February',
      'es': 'Febrero',
    },
    '03aahucz': {
      'en': 'March',
      'es': 'Marzo',
    },
    '5iky3hut': {
      'en': 'April',
      'es': 'Abril',
    },
    '6j3q5k4p': {
      'en': 'May',
      'es': 'Mayo',
    },
    '8vxelt5c': {
      'en': 'June',
      'es': 'Junio',
    },
    'ciewb9u0': {
      'en': 'July',
      'es': 'Julio',
    },
    'fiqbonhg': {
      'en': 'August',
      'es': 'Agosto',
    },
    'ep4ibi4c': {
      'en': 'September',
      'es': 'Setiembre',
    },
    '60ly4bs2': {
      'en': 'October',
      'es': 'Octubre',
    },
    'zx15w9gz': {
      'en': 'November',
      'es': 'Noviembre',
    },
    'g03qp4vf': {
      'en': 'December',
      'es': 'Diciembre',
    },
    '9g9n2i1t': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    '6p8tl0wd': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'a739x16c': {
      'en': '2025',
      'es': '2025',
    },
    'uyj5zho8': {
      'en': '2026',
      'es': '2026',
    },
    '2gd0x9yh': {
      'en': '2027',
      'es': '2027',
    },
    'qrom99ne': {
      'en': '2028',
      'es': '2028',
    },
    'wcg8dvxe': {
      'en': '2029',
      'es': '2029',
    },
    'k5fj4h5v': {
      'en': '2030',
      'es': '2030',
    },
    'rwjwj12l': {
      'en': 'Currency',
      'es': 'Moneda',
    },
    'g41z7ide': {
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    '0treovgv': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'ae7mjcen': {
      'en': 'CRC',
      'es': 'CRC',
    },
    'yk8sd7fx': {
      'en': 'USD',
      'es': 'USD',
    },
    'm2wy9ixj': {
      'en': 'Limite',
      'es': 'Limite',
    },
    'omlgyldu': {
      'en': 'Limite',
      'es': 'Limite',
    },
    '1pzjb2gx': {
      'en': 'Limite is required',
      'es': 'Se requiere límite',
    },
    'bfwr38li': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'ev6h15js': {
      'en': 'Create budget',
      'es': 'Crear presupuesto',
    },
    'mgqq306v': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'ybpf0h8k': {
      'en': 'Edit Budget',
      'es': 'Editar presupuesto',
    },
    'dl1a78zm': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // crearMetaPage
  {
    '1hvg6l5d': {
      'en': 'SmartSavings',
      'es': '',
    },
    'uy24erax': {
      'en': 'Name',
      'es': 'Nombre',
    },
    'c5x9n04t': {
      'en': 'Name',
      'es': 'Nombre',
    },
    'eoowmebw': {
      'en': 'Amount',
      'es': 'Monto',
    },
    'ijacfkkm': {
      'en': 'Amount',
      'es': 'Monto',
    },
    '6vww5s28': {
      'en': 'State',
      'es': 'Estado',
    },
    'r0ldoj4d': {
      'en': 'Accomplished',
      'es': 'Logrado',
    },
    'rgrs6qbb': {
      'en': 'Select.',
      'es': 'Seleccionar.',
    },
    '9hqlj2zd': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'vbhmqw39': {
      'en': 'Accomplished',
      'es': 'Logrado',
    },
    'g9y5zhjv': {
      'en': 'In progress',
      'es': 'En curso',
    },
    'kaoeb4ke': {
      'en': 'Not Achieved',
      'es': 'No logrado',
    },
    'z80ca83a': {
      'en': 'Name is required',
      'es': 'El nombre es obligatorio',
    },
    '15zdahge': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'vympq6zj': {
      'en': 'Used Percentage is required',
      'es': 'Se requiere el porcentaje usado',
    },
    'k1xusjdr': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    '59ttxkw7': {
      'en': 'Create Goal',
      'es': 'Crear categoría',
    },
    'mgtos64f': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'sssh0mv4': {
      'en': 'Create Goals',
      'es': 'Crear metas',
    },
    'txu6g4lu': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // MetasActivasPage
  {
    'l5kjm8xd': {
      'en': 'Active Goals',
      'es': 'Metas activas',
    },
    'bq9zsvfw': {
      'en': 'SmartSavings',
      'es': '',
    },
    'rlooipn9': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // MetasCompletasPage
  {
    'b74mfn2p': {
      'en': 'Accomplished Goals',
      'es': 'Metas cumplidas',
    },
    'q1v3gmil': {
      'en': 'SmartSavings',
      'es': '',
    },
    'pw7j3e26': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // VerMetas
  {
    'g5u5h4g6': {
      'en': 'All Goals',
      'es': 'Metas cumplidas',
    },
    'na698quy': {
      'en': 'SmartSavings',
      'es': '',
    },
    'b041pw5x': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // bottomsheet_change_language
  {
    'jrtdq1pv': {
      'en': 'Select Language',
      'es': 'Seleccionar idioma',
    },
    '8kjbzuvj': {
      'en': 'English',
      'es': 'Inglés',
    },
    'g0m2mfu7': {
      'en': 'Español',
      'es': 'Español',
    },
  },
  // alert_dialog_delete_account
  {
    '7glgphlz': {
      'en': 'Delete account',
      'es': 'Eliminar cuenta',
    },
    'g5dq12gz': {
      'en':
          'Are you sure you want to delete your account? This action cannot be undone.',
      'es':
          '¿Seguro que quieres eliminar tu cuenta? Esta acción no se puede deshacer.',
    },
    '3d9jtasu': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'zfme0zap': {
      'en': 'Confirm',
      'es': 'Confirmar',
    },
  },
  // bottomsheet_notifications
  {
    '4wgvlndo': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    'cyjx093e': {
      'en': 'Turn On',
      'es': 'Encender',
    },
    '9qwychz4': {
      'en': 'Turn Off',
      'es': 'Apagar',
    },
  },
  // bottomsheet_contact
  {
    'cilsgmiw': {
      'en': 'Contact US',
      'es': 'Contáctanos',
    },
    'hkbckh47': {
      'en': 'smartsavings@gmail.com',
      'es': 'smartsavings@gmail.com',
    },
    '862kmrv9': {
      'en': '+506 8000 8888',
      'es': '+506 8000 8888',
    },
    'a736fgm1': {
      'en': 'Dismiss',
      'es': 'Cerrar',
    },
  },
  // Miscellaneous
  {
    'r69iwd0l': {
      'en': '',
      'es': '',
    },
    'rkyis8o4': {
      'en': '',
      'es': '',
    },
    'numtrt8f': {
      'en': '',
      'es': '',
    },
    'wl1usgju': {
      'en': '',
      'es': '',
    },
    'lm8j8et6': {
      'en': '',
      'es': '',
    },
    'rnrk0bfd': {
      'en': '',
      'es': '',
    },
    'j3r89ndo': {
      'en': '',
      'es': '',
    },
    'x5w2ijmx': {
      'en': '',
      'es': '',
    },
    'lybzc8c2': {
      'en': '',
      'es': '',
    },
    '19dnv8il': {
      'en': '',
      'es': '',
    },
    '2f4gdkqz': {
      'en': '',
      'es': '',
    },
    '70wdmq4g': {
      'en': '',
      'es': '',
    },
    'zh3lr2vx': {
      'en': '',
      'es': '',
    },
    'a1xfs6jd': {
      'en': '',
      'es': '',
    },
    'bbko9ojm': {
      'en': '',
      'es': '',
    },
    'jgkscrvd': {
      'en': '',
      'es': '',
    },
    'sik4hrh7': {
      'en': '',
      'es': '',
    },
    '06rxox15': {
      'en': '',
      'es': '',
    },
    'r9n52d32': {
      'en': '',
      'es': '',
    },
    'qcbabdmg': {
      'en': '',
      'es': '',
    },
    'n1pa6jdj': {
      'en': '',
      'es': '',
    },
    '7w9n0v0l': {
      'en': '',
      'es': '',
    },
    'p3i4pkvu': {
      'en': '',
      'es': '',
    },
    'hfw7zoap': {
      'en': '',
      'es': '',
    },
    '848m7i32': {
      'en': '',
      'es': '',
    },
    'v6v3h8su': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
