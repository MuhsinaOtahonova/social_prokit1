import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initializeSupabase() async {
    await Supabase.initialize(
      url: 'https://ownuwkoxpaawhmlvjdtz.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im93bnV3a294cGFhd2htbHZqZHR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTczMzE4NzEsImV4cCI6MjAzMjkwNzg3MX0.RxugdfGKcBrw1Oeu8uYS_r6mAJDbEQmbVkcWGst3dPI',
    );
  }

  static Stream<List<Map<String, dynamic>>> fetchMembers() {
    final userStream = Supabase.instance.client
        .from('member')
        .stream(primaryKey: ['member_id']);
    return userStream;
  }

    static Future<void> addUser(
      String email, String firstName, String password, int homeId) async {
    final response = await Supabase.instance.client.from('member').insert({
      'email': email,
      'name': firstName,
      'password': password,
      'home_id': homeId,
    }).select();

    // if (response.error != null) {
    //   throw response.error!;
    // }
  }


}


