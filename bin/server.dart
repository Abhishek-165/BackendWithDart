import 'dart:io';
import 'package:args/args.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'service.dart';

const _hostname = "localhost";

void main(List<String> args) async {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);

  var portStr = result['port'] ?? Platform.environment['PORT'] ?? '8080';
  var port = int.parse(portStr);

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(Service.handler);

  var server = await io.serve(handler, _hostname, port);

  print('Serving at ${server.address.host} ${server.port}');
}
