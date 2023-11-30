import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../../common_widgets/loaders/loader_uveg/loading_uveg.dart';
import '../../../../../../config/routes/routes.dart';
import '../../../../../../utils/generate_random_number.dart';
import '../../../global/controllers/session_controller.dart';
import '../../../global/dialogs/dialog_sing_in.dart';
import '../controller/sign_in_controller.dart';
import '../controller/sign_in_state.dart';
import 'widgets/background.dart';
import 'widgets/checkbox_list_tile_formfield.dart';
import 'widgets/input_field.dart';

class SingInView extends StatefulWidget {
  const SingInView({super.key});

  @override
  State<SingInView> createState() => _SingInViewState();
}

class _SingInViewState extends State<SingInView> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final random = getNumRamdom();
  @override
  Widget build(BuildContext context) {
    // Se genera el borde redondeado en la card del formulario del login
    final roundedRectangleBorder = RoundedRectangleBorder(
      side: const BorderSide(
        color: Color.fromARGB(179, 235, 231, 231),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return ChangeNotifierProvider<SignInController>(
      create: (_) => SignInController(
        const SignInState(),
        authenticationRepository: context.read(),
      ),
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: Builder(
            builder: (context) {
              final SignInController signInController = context.watch();
              return AbsorbPointer(
                absorbing: signInController.state.fetching,
                child: Background(
                  random: random,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 1,
                        shape: roundedRectangleBorder,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                children: [
                                  InputField(
                                    maxLines: 1,
                                    label: 'Usuario',
                                    isPassword: false,
                                    inputType: TextInputType.name,
                                    icono: const Icon(
                                      Icons.supervised_user_circle,
                                      color: Colors.white,
                                    ),
                                    onChanged: signInController.onUserChanged,
                                    validator: _validatorUser,
                                  ),
                                  const SizedBox(height: 20),
                                  InputField(
                                    maxLines: 1,
                                    label: 'Contraseña',
                                    isPassword: true,
                                    inputType: TextInputType.visiblePassword,
                                    icono: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.white,
                                    ),
                                    onChanged:
                                        signInController.onPasswordChanged,
                                    validator: _validatorPassword,
                                  ),
                                  const _CheckBoxTerms(),
                                  // Tenemos el bontón el cual lanza las validaciones y si nuestro formulario es válido hace la petición
                                  // y nos retorna la informacion necesaria para saber si nuestras credenciales son incorrectas,
                                  // si son correctas solo inicia al menu principal segun el tipo de usuario
                                  const _ButtonLogIn(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String? _validatorPassword(String? text) {
    if (text == null) {
      return 'Rellene el campo contraseña';
    }
    if (text.length > 5) {
      return null;
    }
    return 'La contraseña debe tener más de 6 caracteres';
  }

  String? _validatorUser(String? text) {
    if (text == null) {
      return 'Rellene el campo usuario';
    }
    if (text.length > 3) {
      return null;
    }
    return 'El usuario debe tener más de 4 caracteres';
  }
}

class _ButtonLogIn extends StatelessWidget {
  const _ButtonLogIn();
  @override
  Widget build(BuildContext context) {
    final SignInController signInController = context.watch();
    if (signInController.state.fetching) {
      return const LoadingUveg();
    }

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      disabledColor: Colors.grey,
      elevation: 0,
      // Al dar clic en el boton ejecutamos la funcion sendLoginForm para realizar la petición al server
      onPressed: () {
        //final isValid = _formkey.currentState!.validate();
        final isValid = Form.of(context).validate();
        if (isValid) {
          _submit(context);
        }
      },
      color: Colors.blue,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: const Text(
          'INGRESAR',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


Future<void> _submit(BuildContext context) async {
  final SignInController signInController = context.read();
  final result = await signInController.submit();

  if (!signInController.mounted) {
    return;
  }

  result.when(
    (failure) {
      final message = failure.message;
      final titulo = failure.titulo;
      showDialogSigIn(titulo, context: context, content: message);
    },
    (user) {
      // TODO: Validar el flujo de la navegacion dependiendo el tipo de usuario.
      final sessionController = context.read<SessionController>();

      sessionController.setUser(user!);
      context.replaceNamed(Routes.home);
    },
  );
}

class _CheckBoxTerms extends StatelessWidget {
  const _CheckBoxTerms();

  @override
  Widget build(BuildContext context) {
    // Aqui tenemos el codigo visual para ver el check de los terminos y condiciones, asi como también una manera
    // de ver el listado de los terminos y condiciones en otra vista independiente.
    return Column(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.white,
              ),
              child: CheckboxListTileFormField(
                checkColor: Colors.white,
                title: InkWell(
                  onTap: () {},
                  //context.pushNamed(ShowTermsConditions.ruta),
                  child: const Text(
                    'He leído y acepto los términos y condiciones',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                validator: (bool? value) {
                  if (value!) {
                    return null;
                  } else {
                    return 'Acepte los terminos y condiciones';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                contentPadding: const EdgeInsets.all(1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
