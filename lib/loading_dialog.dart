import 'dart:async';

import 'package:flutter/material.dart';

extension ContextLoading on BuildContext {
  Future<T?> loading<T>(
    Future<T> action, {
    Widget Function(BuildContext)? builder,
  }) async {
    late BuildContext dialogContext;

    unawaited(
      showDialog<void>(
        context: this,
        barrierDismissible: false,
        builder: builder ??= (context) {
          dialogContext = context;
          return WillPopScope(
            onWillPop: () async => false,
            child: Stack(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    final result =
        await action.whenComplete(() => Navigator.of(dialogContext).pop());
    return result;
  }
}
