// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:switch_app/controller/switch_controller.dart';
// import 'package:switch_app/providers/auth_user_provider.dart';
// import 'package:switch_app/providers/switch_provider.dart';
// import 'package:switch_app/widget/text_field_input.dart';
//
// import 'controller/auth_controller.dart';
//
// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({
//     super.key,
//   });
//
//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final uid = ref.watch(authUserProvider);
//
//     return uid.when(
//       data: (uid) {
//         if (uid != null) {
//           final switchState = ref.watch(userProvider(uid));
//           return Scaffold(
//             appBar: AppBar(),
//             body: switchState.when(
//               data: (user) {
//                 return SafeArea(
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Text('aaaa'),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               error: (e, _) => Text('error'),
//               loading: () => CircularProgressIndicator(),
//             ),
//           );
//         } else {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Log In'),
//             ),
//             body: SafeArea(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 32),
//                 width: double.infinity,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       height: 200,
//                     ),
//                     TextFieldInput(
//                       hintText: 'Enter your e-mail',
//                       textEditingController: _emailController,
//                       textInputType: TextInputType.text,
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     TextFieldInput(
//                       hintText: 'Enter your password',
//                       textEditingController: _passwordController,
//                       textInputType: TextInputType.visiblePassword,
//                     ),
//                     const SizedBox(
//                       height: 70,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         ref.read(authProvider).signIn(
//                               email: _emailController.text,
//                               password: _passwordController.text,
//                             );
//                       },
//                       child: Container(
//                         width: 250,
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         decoration: const ShapeDecoration(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(4),
//                             ),
//                           ),
//                           color: Colors.blue,
//                         ),
//                         child: const Text(
//                           'Sign In',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//       error: (e, _) => const Text('error'),
//       loading: () => const CircularProgressIndicator(),
//     );
//   }
// }
