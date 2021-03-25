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
  }) {
    client = Client();
  }

  factory HttpClient.setTodoAPIhost() => HttpClient(host: Configuration.host);

  Uri getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }

  Map<String, String> generateAuthorizationHeader() => {
        HttpConstants.authorization: HttpConstants.authorizationValue,
      };

  Map<String, String> generateRequestHeader([
    Map<String, String> overrideHeader = const {},
  ]) =>
      {
        ...generateAuthorizationHeader(),
        ...overrideHeader,
      };

  dynamic get(
    String path, {
    Map<String, String> overrideHeader = const {},
  }) async {
    final requestHeader = generateRequestHeader(overrideHeader);

    final Response response = await client.get(
      getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  Future<Response> downloadFile(String path) async {
    final requestHeader = generateRequestHeader();

    final Response response = await client.get(
      getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getFileResponse(
      response,
    );
  }

  dynamic post(
    String path,
    dynamic data, {
    Map<String, String> overrideHeader = const {
      HttpConstants.contentType: HttpConstants.jsonContentType
    },
  }) async {
    final requestHeader = generateRequestHeader(overrideHeader);

    final Response response = await client.post(
      getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          data, requestHeader[HttpConstants.contentType]),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic patch(
    String path,
    dynamic data, {
    Map<String, String> overrideHeader = const {},
  }) async {
    final requestHeader = generateRequestHeader(overrideHeader);

    final Response response = await client.patch(
      getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          data, requestHeader[HttpConstants.contentType]),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic put(String path, dynamic data) async {
    final requestHeader = generateRequestHeader();

    final Response response = await client.put(
      getParsedUrl(path),
      body: json.encode(data),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic delete(
    String path, {
    Map<String, String> overrideHeader = const {},
  }) async {
    final requestHeader = generateRequestHeader(overrideHeader);

    final Response response = await client.delete(
      getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(response);
  }

  dynamic deleteWithBody(String path, dynamic data) async {
    final requestHeader = generateRequestHeader();

    final request = Request('DELETE', getParsedUrl(path));
    requestHeader.forEach((key, value) {
      request.headers[key] = value;
    });
    request.body = jsonEncode(data);

    final response = await client.send(request).then(Response.fromStream);

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic getImage(String url) async {
    final Response response = await client.get(url);
    return response;
  }
}
