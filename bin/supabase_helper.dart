import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

class SupabaseClientHelper {
  static SupabaseClient client = SupabaseClient("supabaseUrl", "supabaseKey");

  static Future<Response> getAll() async {
    final response = await client.from('tableName').select().execute();
    var map = {'keyName': response.data};
    return Response.ok(jsonEncode(map));
  }

  static Future<Response> add(Map<String, dynamic> args) async {
    final response = await client.from('tableName').insert(args).execute();
    return Response.ok(jsonEncode(response.data));
  }
}
