import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiji/core/widgets/resource_tile.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/search_bar.dart';
import '../cubit/jiji_cubit.dart';
import '../cubit/jiji_state.dart';

class JijiScreen extends StatefulWidget {
  const JijiScreen({super.key});

  @override
  State<JijiScreen> createState() => _JijiScreenState();
}

class _JijiScreenState extends State<JijiScreen> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'Explain RAG');

    context.read<JijiCubit>().updateQuery(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JijiCubit, JijiState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  'Jiji',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Your AI Friend',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 8),

                Image.asset(
                  'assets/assists_logo.png',
                  height: 180,
                  fit: BoxFit.contain,
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SearchBarField(
                    value: state.query,
                    onSend: () {
                      context.read<JijiCubit>().updateQuery(_controller.text);
                    },
                    controller: _controller,
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView(
                      children: [
                        Text(
                          'Jiji says',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Retrieval-Augmented Generation (RAG) combines search with large language models to improve the accuracy of generated answers.',
                        ),
                        SizedBox(height: 8),
                        Text('• Retrieves data from external sources'),
                        Text('• Uses a language model to generate answers'),
                        Text('• Enhances the accuracy of responses'),
                        SizedBox(height: 16),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 6),
                            ResourceTile(
                              icon: Icons.co_present_outlined,
                              iconColor: Colors.orange,
                              title: 'Presentation on RAG',
                              subtitle: 'PowerPoint Presentation',
                              action: 'Open',
                              actionColor: AppColors.primary,
                            ),
                            // SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15,
                              ),
                              child: Divider(
                                color: Colors.grey.withAlpha(180),
                                thickness: .4,
                              ),
                            ),
                            ResourceTile(
                              icon: Icons.play_circle,
                              iconColor: Colors.red,
                              title: 'What is RAG? Retrieval-Augmented…',
                              subtitle: 'YouTube Video',
                              action: 'Watch',
                              actionColor: Colors.blue,
                            ),
                          ],
                        ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jiji/core/theme/app_colors.dart';
// import 'package:jiji/core/widgets/search_bar.dart';
// import 'package:jiji/features/cubit/jiji_cubit.dart';
// import 'package:jiji/features/cubit/jiji_state.dart';

// class JijiScreen extends StatefulWidget {
//   const JijiScreen({super.key});

//   @override
//   State<JijiScreen> createState() => _JijiScreenState();
// }

// class _JijiScreenState extends State<JijiScreen> {
//   late final TextEditingController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController(text: 'Explain RAG');

//     // sync initial value with cubit
//     context.read<JijiCubit>().updateQuery(_controller.text);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<JijiCubit, JijiState>(
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             title: Column(
//               children: const [
//                 Text(
//                   'Jiji',
//                   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Your AI Friend',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: AppColors.textSecondary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           backgroundColor: AppColors.background,
//           body: Column(
//             children: [
//               const SizedBox(height: 8),

//               Image.asset(
//                 'assets/assists_logo.png',
//                 height: 180,
//                 fit: BoxFit.contain,
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: SearchBarField(
//                   controller: _controller,
//                   value: state.query,
//                   onSend: () {
//                     context.read<JijiCubit>().updateQuery(_controller.text);
//                   },
//                 ),
//               ),

//               // rest of your UI unchanged
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
