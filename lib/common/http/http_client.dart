import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:clean_code_architecture_flutter/common/configs/configuration.dart';
import 'package:clean_code_architecture_flutter/common/constants/http_constants.dart';
import 'package:clean_code_architecture_flutter/common/utils/http_utils.dart';

class HttpClient {
  Client client;
  String host;
  Map<String, String> header;

  HttpClient({
    @required this.host,
    this.client,
  }) {
    client ??= Client();
  }

  factory HttpClient.setTodoAPIhost() => HttpClient(host: Configuration.host);

  Uri _getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }

  Map<String, String> _generateAuthorizationHeader() => {
        HttpConstants.authorization: HttpConstants.authorizationValue,
        HttpConstants.contentType: HttpConstants.jsonContentType
      };

  Map<String, String> _generateRequestHeader([
    Map<String, String> overrideHeader = const {},
  ]) =>
      {
        ..._generateAuthorizationHeader(),
        ...overrideHeader,
      };

  dynamic get(String path) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.get(
      _getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic post(String path, dynamic data) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.post(
      _getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          data, requestHeader[HttpConstants.contentType]),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic patch(String path, dynamic data) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.patch(
      _getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          data, requestHeader[HttpConstants.contentType]),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic put(String path, dynamic data) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.put(
      _getParsedUrl(path),
      body: json.encode(data),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic delete(String path) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.delete(
      _getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(response);
  }

  dynamic getImage(String url) async {
    final Response response = await client.get(url);
    return response;
  }
}
