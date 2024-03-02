import 'package:flutter/material.dart';

class LoggerService {
  functionLogs({String? className, String? funtionName, String? extra, String? log, StackTrace? stackTrace}) {
    debugPrint(log);
  }

  appLogs({String? className, String? funtionName, String? extra, String? log, StackTrace? stackTrace}) {
    debugPrint(log);
  }
}
