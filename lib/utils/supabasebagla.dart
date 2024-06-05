import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initializeSupabase() async {
    await Supabase.initialize(
      url: 'https://xflffrnsyxqttkkafeeh.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhmbGZmcm5zeXhxdHRra2FmZWVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUwNjI5NDQsImV4cCI6MjAzMDYzODk0NH0.5r_yEdy864eMV_Pd1u4UGyloThV8ORx6ftLur8XOVpA',
    );
  }

  static Stream<List<Map<String, dynamic>>> fetchMembers() {
    final userStream = Supabase.instance.client
        .from('member')
        .stream(primaryKey: ['member_id']);
    return userStream;
  }


}


