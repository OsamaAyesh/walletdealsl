import 'dart:convert'; // لاستيراد مكتبة تحويل البيانات إلى JSON
import 'package:http/http.dart' as http; // لاستخدام مكتبة http لإجراء الطلبات الشبكية

// ApiService هو المسؤول عن إجراء الاتصال مع الـ API (واجهات برمجة التطبيقات)
class ApiService {
  // قاعدة URL الخاصة بالتطبيق، سيتم تمريرها عند إنشاء الكائن
  final String baseUrl;

  // Constructor لتحديد الـ baseUrl عند إنشاء الكائن
  ApiService(this.baseUrl);

  // إرسال طلب GET إلى الـ API
  Future<http.Response> get(String path, {Map<String, dynamic>? params}) async {
    // إنشاء عنوان URL باستخدام baseUrl والمسار المطلوب (path) مع المعلمات (params)
    final uri = Uri.parse('$baseUrl$path').replace(queryParameters: params);

    // إرسال الطلب GET إلى الـ API واستلام الاستجابة
    final response = await http.get(uri);

    // معالجة الاستجابة باستخدام دالة _handleResponse
    return _handleResponse(response);
  }

  // إرسال طلب POST إلى الـ API
  Future<http.Response> post(String path, {dynamic data}) async {
    // إنشاء عنوان URL باستخدام baseUrl والمسار المطلوب (path)
    final uri = Uri.parse('$baseUrl$path');

    // إرسال الطلب POST إلى الـ API مع إرسال البيانات على هيئة JSON
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'}, // تعيين نوع المحتوى كـ JSON
      body: jsonEncode(data), // تحويل البيانات إلى JSON قبل إرسالها
    );

    // معالجة الاستجابة باستخدام دالة _handleResponse
    return _handleResponse(response);
  }

  // دالة خاصة لمعالجة الاستجابة من الـ API
  http.Response _handleResponse(http.Response response) {
    // إذا كانت حالة الاستجابة بين 200 و 299، فهي تعتبر استجابة ناجحة
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      // في حال وجود خطأ في الاستجابة (مثل 400 أو 500)، يتم إلقاء استثناء
      throw Exception('HTTP Error: ${response.statusCode}, ${response.body}');
    }
  }
}
