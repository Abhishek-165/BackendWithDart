import 'package:shelf/shelf.dart';
import 'dart:convert';
import 'package:shelf_router/shelf_router.dart';
import 'supabase_helper.dart';

class Service {
  static Handler get handler {
    final router = Router();

    router.get('/all', (Request req) async {
      return await SupabaseClientHelper.getAll();
    });

    router.post('/add', (Request req) async {
      Map<String, dynamic> arguments = jsonDecode(await req.readAsString());
      return await SupabaseClientHelper.add(arguments);
    });

    router.all('/<ignroed|.*>', (Request req) async {
      return Response.notFound("404 API Not Found");
    });

    return router;
  }
}
