library gateway;

import 'dart:io';

import 'package:common/common.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:gateway/model/api_error_model.dart';
import 'package:gateway/model/model.dart';
import './home/recommend_feed_response.dart';

export './home/recommend_feed_response.dart';
export 'model/api_error_model.dart';
export 'http_api_callback.dart';

part 'http_client.dart';
part './home/api_recommend.dart';
