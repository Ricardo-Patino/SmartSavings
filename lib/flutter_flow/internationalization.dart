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
  // report
  {
    'pxio3obv': {
      'en': 'Statistics',
      'es': 'Estadística',
    },
    '27cpwyz9': {
      'en': 'OVERVIEW',
      'es': 'DESCRIPCIÓN GENERAL',
    },
    'ohe1klja': {
      'en': 'DETAILS',
      'es': 'DETALLES',
    },
    'g0u3eplo': {
      'en': 'Stats',
      'es': 'Estadística',
    },
  },
  // settings
  {
    '2l9eplby': {
      'en': 'Settings',
      'es': 'Ajustes',
    },
    'r3tu0ri4': {
      'en': 'SmartSavingTest',
      'es': 'Joe Doe',
    },
    'cypi8362': {
      'en': 'test@samrtsavings.com',
      'es': 'prueba@samrtsavings.com',
    },
    'z6l4z05o': {
      'en': 'Choose language',
      'es': 'Elija el idioma',
    },
    'mclatdop': {
      'en': 'Reset password',
      'es': 'Restablecer contraseña',
    },
    '9k130f6f': {
      'en': 'Reset password',
      'es': 'Restablecer contraseña',
    },
    'ytxm8o05': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'of5k9y8y': {
      'en': 'Confirm',
      'es': 'Confirmar',
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
      'en': 'Do you really want to get out of Kitty?',
      'es': '¿De verdad quieres salir de Kitty?',
    },
    'u77kd0xv': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'x1zlnj43': {
      'en': 'Confirm',
      'es': 'Confirmar',
    },
    'e5cc1y17': {
      'en': 'Delete account',
      'es': 'Eliminar cuenta',
    },
    'pao7utco': {
      'en': 'Donate',
      'es': 'Donar',
    },
    'd3mknvvt': {
      'en': 'Settings',
      'es': 'Ajustes',
    },
  },
  // createExpense
  {
    'fpobmyte': {
      'en': 'Income',
      'es': 'Ingreso',
    },
    '3klurzok': {
      'en': 'Income/Budget',
      'es': 'Ingresos/Presupuesto',
    },
    'vy8e0ryy': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '9acdjdrd': {
      'en': 'Expense',
      'es': 'Gastos',
    },
    'u0a7tcan': {
      'en': 'Invoice',
      'es': 'Factura',
    },
    'dnb6be8k': {
      'en': 'Select Category',
      'es': 'Seleccionar categoría',
    },
    '7trmhkmt': {
      'en': 'Search for an category',
      'es': 'Buscar una categoría',
    },
    '9aedrjo6': {
      'en': 'Cafe',
      'es': 'Cafetería',
    },
    'qtnqe1gr': {
      'en': 'Donate',
      'es': 'Donar',
    },
    '01q69rbk': {
      'en': 'Education',
      'es': 'Educación',
    },
    'xgex1toh': {
      'en': 'Electronics',
      'es': 'Electrónica',
    },
    'wpbca363': {
      'en': 'Fuel',
      'es': 'Combustible',
    },
    'k3dp84tb': {
      'en': 'Gifts',
      'es': 'Regalos',
    },
    '01ofez8y': {
      'en': 'Groceries',
      'es': 'Comestibles',
    },
    'wniujuhd': {
      'en': 'Health',
      'es': 'Salud',
    },
    'imwgy8r6': {
      'en': 'Institute',
      'es': 'Instituto',
    },
    'qkpmudg0': {
      'en': 'Laundry',
      'es': 'Lavadero',
    },
    '41nxlk99': {
      'en': 'Liquor',
      'es': 'Espíritu',
    },
    'y76rocai': {
      'en': 'Maintenance',
      'es': 'Mantenimiento',
    },
    '2g5bblws': {
      'en': 'Party',
      'es': 'Fiesta',
    },
    '3x9rfu5h': {
      'en': 'Resturant',
      'es': 'Restaurante',
    },
    '3755zwmx': {
      'en': 'Savings',
      'es': 'Ahorros',
    },
    'vxa67gbw': {
      'en': 'Self Development',
      'es': 'Desarrollo personal',
    },
    '9megapk5': {
      'en': 'Sport',
      'es': 'Deporte',
    },
    'cqknees2': {
      'en': 'Transportation',
      'es': 'Transporte',
    },
    'gwjpp0l1': {
      'en': 'Enter amount',
      'es': 'Ingrese el monto',
    },
    'tf6lw3vg': {
      'en': 'Description (Optional)',
      'es': 'Descripción (opcional)',
    },
    'e0vktzak': {
      'en': 'Add a new',
      'es': 'Agregar uno nuevo',
    },
    '58q75359': {
      'en': 'Amount is required',
      'es': 'Se requiere cantidad',
    },
    'c842khfl': {
      'en': 'Invalid value for Amount. Ex: 90.50',
      'es': 'Valor no válido para el importe. Ejemplo: 90,50',
    },
    'bcchv2ht': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    '0jwizuht': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    '98ardp74': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'zhym1v85': {
      'en': 'Add new',
      'es': 'Añadir nuevo',
    },
    'jjce6u3q': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // login
  {
    'qggdbtg4': {
      'en': 'Smart\$avings',
      'es': 'Ahorros inteligentes',
    },
    'kxiutu7a': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    '8onoh62b': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'amao6idu': {
      'en':
          'Get started by creating your account manage on multiple devices anytime! ',
      'es':
          '¡Comienza creando tu cuenta para proteger tus datos y administrarlos en múltiples dispositivos en cualquier momento!',
    },
    'j4h5pupr': {
      'en': '',
      'es': '',
    },
    'mb5anmnv': {
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
      'es': 'Crear una cuenta',
    },
    'u6qfqqol': {
      'en': 'Log In',
      'es': 'Acceso',
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
  // searchScreen
  {
    'f6qitlvn': {
      'en': 'Search for categories or labels',
      'es': 'Buscar categorías o etiquetas',
    },
    'z0p8gblh': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // editExpense
  {
    'cgf3ygl7': {
      'en': 'Income',
      'es': 'Ingreso',
    },
    'hko6ezg3': {
      'en': 'Income/Budget',
      'es': 'Ingresos/Presupuesto',
    },
    'vw8adcit': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'fw9vxr1w': {
      'en': 'Expense',
      'es': 'Gastos',
    },
    'c8ij0gvp': {
      'en': 'Invoice',
      'es': 'Factura',
    },
    'q8mye2zp': {
      'en': 'Select Category',
      'es': 'Seleccionar categoría',
    },
    'f0jdrxdm': {
      'en': 'Search for an category',
      'es': 'Buscar una categoría',
    },
    'nr8h2ng1': {
      'en': 'Cafe',
      'es': 'Cafetería',
    },
    'z05440ij': {
      'en': 'Donate',
      'es': 'Donar',
    },
    '5uh6sul0': {
      'en': 'Education',
      'es': 'Educación',
    },
    'w5hqz7yh': {
      'en': 'Electronics',
      'es': 'Electrónica',
    },
    '8gw9w48m': {
      'en': 'Fuel',
      'es': 'Combustible',
    },
    'x9y9xu7k': {
      'en': 'Gifts',
      'es': 'Regalos',
    },
    'liw1djky': {
      'en': 'Groceries',
      'es': 'Comestibles',
    },
    'nz1ihdqw': {
      'en': 'Health',
      'es': 'Salud',
    },
    '80ibmr1j': {
      'en': 'Institute',
      'es': 'Instituto',
    },
    'yva1sh8h': {
      'en': 'Laundry',
      'es': 'Lavadero',
    },
    'nu1fvykc': {
      'en': 'Liquor',
      'es': 'Espíritu',
    },
    'bv3dr91r': {
      'en': 'Maintenance',
      'es': 'Mantenimiento',
    },
    'etzdfyfa': {
      'en': 'Party',
      'es': 'Fiesta',
    },
    '6fyj8k7i': {
      'en': 'Resturant',
      'es': 'Restaurante',
    },
    '23e13o2q': {
      'en': 'Savings',
      'es': 'Ahorros',
    },
    'ydnrvygz': {
      'en': 'Self Development',
      'es': 'Desarrollo personal',
    },
    '057cd24w': {
      'en': 'Sport',
      'es': 'Deporte',
    },
    'dbec15tp': {
      'en': 'Transportation',
      'es': 'Transporte',
    },
    'ifjlvbhd': {
      'en': 'Enter amount',
      'es': 'Ingrese el monto',
    },
    'vg84m6jc': {
      'en': 'Description (Optional)',
      'es': 'Descripción (opcional)',
    },
    'rt1ash54': {
      'en': 'Edit',
      'es': 'Editar',
    },
    'tbhvf5pj': {
      'en': 'Delete',
      'es': 'Borrar',
    },
    'izjvzi7f': {
      'en': 'Confirm delete',
      'es': 'Confirmar eliminación',
    },
    'r4m1t0a1': {
      'en': 'Are you sure you want to delete this expense/income?',
      'es': '¿Está seguro de que desea eliminar este gasto/ingreso?',
    },
    '2gh6bfnu': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '6bd89nbx': {
      'en': 'Confirm',
      'es': 'Confirmar',
    },
    'z0ydpuso': {
      'en': 'Amount is required',
      'es': 'Se requiere cantidad',
    },
    '0636u1e0': {
      'en': 'Invalid value for Amount. Ex: 90.50',
      'es': 'Valor no válido para el importe. Ejemplo: 90,50',
    },
    'ayp6tbzf': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'b2iwa2um': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    '9rowbj3s': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    '0rsd07xx': {
      'en': 'Edit',
      'es': 'Editar',
    },
    'qva4jc6s': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PerfildeUsuario
  {
    'ow9023ah': {
      'en': 'Log Out',
      'es': '',
    },
    'd5ox2g9q': {
      'en': 'User´s Name',
      'es': '',
    },
    'pq0004sk': {
      'en': 'test@smartsavings.com',
      'es': '',
    },
    'olzd7fic': {
      'en': 'Active',
      'es': '',
    },
    'elvretnm': {
      'en': 'Edit Profile',
      'es': '',
    },
    'rs7yh16p': {
      'en': 'Account Settings',
      'es': '',
    },
    'apxdysql': {
      'en': 'User´s Profile',
      'es': 'Perfil de Usuario',
    },
    'm3e43j1h': {
      'en': '__',
      'es': '',
    },
  },
  // RecuperarCuenta
  {
    'yye6rchf': {
      'en': 'Recover your Account',
      'es': 'Recuperar la Cuenta',
    },
    'glv2fwtw': {
      'en': 'Account Recovery',
      'es': 'Recuperar cuenta',
    },
    '57y9rke6': {
      'en': 'Recover your Account',
      'es': 'Recupera la cuenta',
    },
    'aw6f1y64': {
      'en':
          'Enter your email address to receive an email containing a temporary password',
      'es':
          'Introduce tu correo electrónico para enviarte un email con una contraseña temporal.',
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
      'en': 'Send Password',
      'es': 'Enviar Contraseña',
    },
    'bstwbuvq': {
      'en': 'Not an active user? Sign up.',
      'es': 'No es un usuario activo? Registrarse.',
    },
    '16dr7ewz': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    '7byge8vi': {
      'en': 'Settings',
      'es': 'Hogar',
    },
  },
  // MainPage
  {
    'ghny3a8m': {
      'en': 'Página Principal',
      'es': '',
    },
    'azbojv9q': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    'ciopx9q0': {
      'en': 'Registrar Transacción',
      'es': '',
    },
    'pokpgbki': {
      'en': 'Categorías',
      'es': '',
    },
    'hes8elfq': {
      'en': 'Presupuesto',
      'es': '',
    },
    'iqkqu7v4': {
      'en': 'Estadísticas y Reportes',
      'es': '',
    },
    '489bv5vf': {
      'en': 'Metas de Ahorro',
      'es': '',
    },
    'd0ur809j': {
      'en': 'Gestión de Alertas',
      'es': '',
    },
    '5rr88xh3': {
      'en': 'Sincronizar con la Nube',
      'es': '',
    },
    'iiyrc3bk': {
      'en': 'Home',
      'es': '',
    },
  },
  // CategoriaPage
  {
    'ddij108r': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    '9tjrw4x8': {
      'en': 'Crear categoría',
      'es': '',
    },
    'm7aautrm': {
      'en': 'Categorías',
      'es': '',
    },
    'km7bkpuz': {
      'en': 'Home',
      'es': '',
    },
  },
  // CrearCategoriaPage
  {
    't1lixowk': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    'qiaafl4j': {
      'en': 'Nombre',
      'es': '',
    },
    'fa1x0kh3': {
      'en': 'Nombre',
      'es': '',
    },
    'vozrptl0': {
      'en': 'Porcentaje',
      'es': '',
    },
    'zwzvf8zh': {
      'en': 'Procentaje usado',
      'es': '',
    },
    'za256662': {
      'en': 'Color',
      'es': '',
    },
    '0w28gbwg': {
      'en': 'Select...',
      'es': '',
    },
    '4jmikidz': {
      'en': 'Search...',
      'es': '',
    },
    'klgbcsxe': {
      'en': 'Rojo',
      'es': '',
    },
    'ndb9d8pa': {
      'en': 'Verde',
      'es': '',
    },
    'a6mzulwf': {
      'en': 'Amarillo',
      'es': '',
    },
    'd3hz1xvz': {
      'en': 'Azul',
      'es': '',
    },
    'nxwscjm0': {
      'en': 'Gris',
      'es': '',
    },
    'ky40uiaw': {
      'en': 'Tipo',
      'es': '',
    },
    'x4s7e1yc': {
      'en': 'Tipo',
      'es': '',
    },
    '2948cd55': {
      'en': 'Crear categoría',
      'es': '',
    },
    'ar6aybgb': {
      'en': 'Cancelar',
      'es': '',
    },
    '602ox0fn': {
      'en': 'Crear Categorías',
      'es': '',
    },
    'u7bbj4hw': {
      'en': 'Home',
      'es': '',
    },
  },
  // EditarCategoriaPage
  {
    'hq73frmb': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    's726lfh5': {
      'en': 'Nombre',
      'es': '',
    },
    'z0529trb': {
      'en': 'Nombre',
      'es': '',
    },
    'iy9s5a4n': {
      'en': 'Porcentaje',
      'es': '',
    },
    'iftau0uw': {
      'en': 'Porcentaje usado',
      'es': '',
    },
    'hs6fgotm': {
      'en': 'Color',
      'es': '',
    },
    '75kqdyhm': {
      'en': 'Seleccione',
      'es': '',
    },
    'w3o4844w': {
      'en': 'Search...',
      'es': '',
    },
    '4j23yr0b': {
      'en': 'Rojo',
      'es': '',
    },
    'y9gszw9w': {
      'en': 'Verde',
      'es': '',
    },
    'bt0k2c3b': {
      'en': 'Amarillo',
      'es': '',
    },
    'rwxt0ak6': {
      'en': 'Azul',
      'es': '',
    },
    'p45psbt7': {
      'en': 'Gris',
      'es': '',
    },
    '5eojpxmy': {
      'en': 'Tipo',
      'es': '',
    },
    'bx0rab4u': {
      'en': 'Tipo',
      'es': '',
    },
    '53vrqsjd': {
      'en': 'Editar categoría',
      'es': '',
    },
    'avq7q6gk': {
      'en': 'Cancelar',
      'es': '',
    },
    'uxiky8qi': {
      'en': 'Editar Categorías',
      'es': '',
    },
    'vr15lact': {
      'en': 'Home',
      'es': '',
    },
  },
  // TransaccionPage
  {
    'cc5gj5n9': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    'gngiegcm': {
      'en': '',
      'es': '',
    },
    'scer8xjf': {
      'en': 'Crear transacción',
      'es': '',
    },
    'os8b4ogr': {
      'en': 'Transacciones',
      'es': '',
    },
    'uncw6xni': {
      'en': 'Home',
      'es': '',
    },
  },
  // CrearTransaccionPage
  {
    'ndg73yu8': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    'dmfu4gdt': {
      'en': 'Nombre',
      'es': '',
    },
    'dll99w07': {
      'en': 'Nombre',
      'es': '',
    },
    'wgeoo1jp': {
      'en': 'Porcentaje',
      'es': '',
    },
    'fcxdwh8z': {
      'en': 'Procentaje usado',
      'es': '',
    },
    'smih3um0': {
      'en': 'Color',
      'es': '',
    },
    'im7hpxx2': {
      'en': 'Select...',
      'es': '',
    },
    'e5vzwhi1': {
      'en': 'Search...',
      'es': '',
    },
    'gh2367ja': {
      'en': 'Rojo',
      'es': '',
    },
    '1xbqag01': {
      'en': 'Verde',
      'es': '',
    },
    'xu0wl2k1': {
      'en': 'Amarillo',
      'es': '',
    },
    'uskgc983': {
      'en': 'Azul',
      'es': '',
    },
    'gkohwqwe': {
      'en': 'Gris',
      'es': '',
    },
    '2fly2xw4': {
      'en': 'Tipo',
      'es': '',
    },
    '1prora8a': {
      'en': 'Tipo',
      'es': '',
    },
    '6z52fg0u': {
      'en': 'Crear categoría',
      'es': '',
    },
    '088rg041': {
      'en': 'Cancelar',
      'es': '',
    },
    '6q78m2ev': {
      'en': 'Crear Categorías',
      'es': '',
    },
    '7bxj4lnw': {
      'en': 'Home',
      'es': '',
    },
  },
  // Estadisticas
  {
    '5ia153st': {
      'en': 'Estadísticas y Reportes',
      'es': '',
    },
    '35s27jql': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    'c0ax7k2b': {
      'en': 'Resumen Mensual',
      'es': '',
    },
    'm8t17lm3': {
      'en': 'Categorías',
      'es': '',
    },
    'kx7nk5nm': {
      'en': 'Histórico',
      'es': '',
    },
    'qjo5jlrb': {
      'en': 'Home',
      'es': '',
    },
  },
  // ResumenMensual
  {
    'gjoby9av': {
      'en': 'Resumen Mensual',
      'es': '',
    },
    'seixb9o8': {
      'en': '',
      'es': '',
    },
    'mx7bpzwl': {
      'en': 'Button',
      'es': '',
    },
    'pvnqyjiw': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    '0w4dx888': {
      'en': 'Home',
      'es': '',
    },
  },
  // ResumeCategoria
  {
    'xb60b5b8': {
      'en': 'Resumen Por Categoría',
      'es': '',
    },
    'o9gn4vi7': {
      'en': '',
      'es': '',
    },
    'qjg8rmdj': {
      'en': 'Button',
      'es': '',
    },
    'feau829z': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    'lq28g4qp': {
      'en': 'Home',
      'es': '',
    },
  },
  // ResumenHistorico
  {
    '9cgiyqhv': {
      'en': 'Resumen Histórico',
      'es': '',
    },
    'e6jwfipq': {
      'en': '',
      'es': '',
    },
    '4doav718': {
      'en': 'Button',
      'es': '',
    },
    '2r39jn3v': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    'cjdeuzi9': {
      'en': 'Home',
      'es': '',
    },
  },
  // MetasAhorro
  {
    '8ntertnt': {
      'en': 'Metas de Ahorro',
      'es': '',
    },
    'qj1z20s0': {
      'en': 'Qué estás buscando?',
      'es': '',
    },
    'ewytv51a': {
      'en': 'Metas Activas',
      'es': '',
    },
    '9myo5efr': {
      'en': '',
      'es': '',
    },
    '3g9a81nt': {
      'en': 'Metas Cumplidas',
      'es': '',
    },
    'rn06nvpv': {
      'en': '',
      'es': '',
    },
    'djnluawr': {
      'en': 'Home',
      'es': '',
    },
  },
  // month_picker_dialog
  {
    'kitcrcil': {
      'en': 'PICK A MONTH',
      'es': 'ELIGE UN MES',
    },
    'oaiocrqj': {
      'en': 'ALL TIME',
      'es': 'TODOS LOS TIEMPOS',
    },
  },
  // user_name_icon
  {
    '6qw7pk5q': {
      'en': 'SS',
      'es': 'Yo',
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
