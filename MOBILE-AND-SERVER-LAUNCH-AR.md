# NOVA AI — تجهيز Android وiPhone والخادم (دليل عربي)

## مهم قبل النشر العام
هذه حزمة تطوير، وليست تطبيقاً منشوراً أو APK/IPA جاهزاً. الخادم الحالي لا يزال يحتاج مراجعة أمنية، حماية إساءة الاستخدام، إدارة أسرار، HTTPS، نسخاً احتياطية ومراجعة مستقلة قبل نشره على الإنترنت.

## 1) تشغيل الخادم محلياً
- Python 3.10+ مطلوب.
- من مجلد المشروع: `python backend/server.py`
- تشغيل الموقع: `python -m http.server 5500` ثم افتح `http://127.0.0.1:5500/auth.html`.

## 2) إعداد عنوان API
صفحات المشروع تستخدم `api-config.js`. عنوان API الافتراضي محلي. في نسخة مستضافة، اجعل `window.NOVA_API_BASE`/المفتاح المحلي `nova_api_base` يشير إلى عنوان HTTPS للخادم، ثم أعد بناء حزمة الهاتف. لا تستخدم HTTP مع حسابات حقيقية.

## 3) Android
1. تثبيت Node.js LTS وAndroid Studio وJDK المناسب.
2. افتح Terminal في `mobile`: `npm install`.
3. أضف المنصة: `npx cap add android` (مرة واحدة).
4. `npm run sync` ثم `npm run android`.
5. في Android Studio اختبر على جهاز أو محاكي ثم Build > Generate Signed App Bundle/APK.

## 4) iPhone
يتطلب Mac وXcode وحساب Apple Developer للنشر على App Store.
1. في `mobile`: `npm install`.
2. `npx cap add ios` (مرة واحدة).
3. `npm run sync` ثم `npm run ios`.
4. في Xcode اختر Team، وقم بالتوقيع والاختبار ثم Archive.

## 5) تشغيل Docker (تجهيز فقط)
`docker compose up --build` — يحتاج Docker. لا تضع هذا الخادم على الإنترنت قبل مراجعة الأمان. إعداد CORS يحدد origins في `NOVA_ALLOWED_ORIGINS`.

## حدود النسخة
لا يوجد تشفير طرفي E2EE، ولا مكالمات صوت/فيديو، ولا Push notifications مكتملة. ملفات الرسائل محدودة الحجم، ويجب مراجعة سياسة حذف البيانات والخصوصية والاعتدال قبل النشر.
