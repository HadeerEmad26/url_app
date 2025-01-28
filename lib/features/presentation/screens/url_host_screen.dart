// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_app/core/database/cache_helper/cache_helper.dart';
// import 'package:url_app/core/utils/app_strings.dart';
// import 'package:url_app/core/widgets/custom_button.dart';
// import 'package:url_app/core/widgets/custom_text_form_field.dart';
// import 'package:url_app/features/presentation/cubit/url_cubit.dart';
// import 'package:url_app/features/presentation/cubit/url_state.dart';
// import 'package:url_app/features/presentation/screens/login.dart';
// import '../../../core/utils/app_colors.dart';
// import '../../../core/utils/commens.dart';
// import '../../../core/widgets/custom_loading_indicator.dart';
//
// class UrlHostScreen extends StatelessWidget {
//   const UrlHostScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     UrlCubit cubit = UrlCubit();
//
//     // Check if the screen has been visited before
//     if (CacheHelper.getData(key: 'hasVisitedUrlHostScreen') == true) {
//       // Redirect to login screen if already visited
//       Future.microtask(() {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const Login()),
//         );
//       });
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add Base URL')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: BlocConsumer<UrlCubit, UrlState>(
//           listener: (context, state) {
//             if (state is EnterBaseUrlSuccessState) {
//               showToast(
//                   message: "Url Entered", state: ToastStates.success);
//
//               // Save flag to indicate this screen has been visited
//               CacheHelper.saveData(key: 'hasVisitedUrlHostScreen', value: true);
//
//               // Navigate to login screen
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (_) => const Login()),
//               );
//             }
//             if (state is EnterBaseUrlErrorState) {
//               showToast(message: state.message, state: ToastStates.error);
//             }
//           },
//           builder: (context, state) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Text field for URL input
//                 CustomTextFormField(
//                   controller: cubit.baseUrlController,
//                   label: "Enter Base Url",
//                   validate: (data) {
//                     if (data!.isEmpty || !data.contains('https')) {
//                       return "Enter Valid Base Url";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 25.h),
//                 SizedBox(
//                   height: 44.h,
//                   width: 200.w,
//                   child: state is EnterBaseUrlLoadingState
//                       ? const CustomLoadingIndicator()
//                       : CustomButton(
//                     onPressed: () async {
//                       if (cubit.baseUrlController.text.isNotEmpty) {
//                         CacheHelper.saveNewHost(cubit.baseUrlController.text);
//                         AppStrings.baseUrl = cubit.baseUrlController.text;
//
//                         // Trigger success state
//                         BlocProvider.of<UrlCubit>(context)
//                             .emit(EnterBaseUrlSuccessState());
//                       }
//                     },
//                     background: AppColors.green,
//                     text: "Done",
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_app/core/database/cache_helper/cache_helper.dart';
// import 'package:url_app/core/utils/app_strings.dart';
// import 'package:url_app/core/widgets/custom_button.dart';
// import 'package:url_app/core/widgets/custom_text_form_field.dart';
// import '../../../core/utils/app_colors.dart';
// import '../../../core/utils/commens.dart';
//
// import 'package:webview_flutter/webview_flutter.dart';
//
//
// class UrlHostScreen extends StatefulWidget {
//   const UrlHostScreen({super.key});
//
//   @override
//   _UrlHostScreenState createState() => _UrlHostScreenState();
// }
//
// class _UrlHostScreenState extends State<UrlHostScreen> {
//   final TextEditingController _urlController = TextEditingController();
//   String? _currentUrl; // Stores the URL for WebView
//   WebViewController? _webViewController; // WebView controller
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add Base URL')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Input field for the URL
//             CustomTextFormField(
//               controller: _urlController,
//               label: "Enter Base Url",
//               validate: (data) {
//                 if (data!.isEmpty || !data.startsWith('https://')) {
//                   return "Enter a valid URL (starting with https://)";
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 16.h),
//
//             // Button to load the URL
//             SizedBox(
//               height: 44.h,
//               width: double.infinity,
//               child: CustomButton(
//                 onPressed: () {
//                   final enteredUrl = _urlController.text;
//                   if (enteredUrl.isNotEmpty && enteredUrl.startsWith('https://')) {
//                     setState(() {
//                       _currentUrl = enteredUrl; // Update the current URL
//                     });
//                   } else {
//                     showToast(
//                       message: "Please enter a valid URL",
//                       state: ToastStates.error,
//                     );
//                   }
//                 },
//                 background: AppColors.green,
//                 text: "Open URL",
//               ),
//             ),
//             SizedBox(height: 16.h),
//
//             // WebView or Placeholder
//             Expanded(
//               child: _currentUrl != null
//                   ? WebView(
//                 initialUrl: _currentUrl, // Load the entered URL
//                 onWebViewCreated: (controller) {
//                   _webViewController = controller;
//                 },
//                 javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
//               )
//                   : Center(
//                 child: Text(
//                   "Enter a URL and press 'Open URL' to view it here.",
//                   style: TextStyle(fontSize: 16.sp),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebView Example')),
      body: const WebView(
        initialUrl: 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

