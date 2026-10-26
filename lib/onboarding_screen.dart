import 'package:flutter/material.dart';
import 'onboarding_model.dart'; // استدعي ملف المودل اللي عملناه فوق

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121), // لون خلفية التطبيق الداكن (زي فيجما)
      body: SafeArea(
        child: Column(
          children: [
            // شعار Islami الثابت في أعلى الشاشة
            // شعار Islami في أعلى الشاشة بحجم كبير وواضح
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Image.asset(
                  'assets/images/islami.png', // مسار صورة اللوجو بتاعتك
                  height: 120, // زودي الرقم ده عشان تكبري الصورة (مثلاً خليه 60 أو 70 لحد ما يناسب حجم الشاشة)
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // الـ PageView لعرض الشاشات بالسحب
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // صورة السلايد
                        Expanded(
                          child: Image.asset(
                            contents[i].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 30),
                        // عنوان السلايد
                        Text(
                          contents[i].title,
                          style: const TextStyle(
                            color: Color(0xFFE2BE7F), // اللون الذهبي المميز للتصميم
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        // وصف السلايد (إن وجد)
                        Text(
                          contents[i].description,
                          style: const TextStyle(
                            color: Color(0xFFE2BE7F),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // مؤشر النقاط (Indicators) وأزرار التنقل في الأسفل
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // زر Back (يظهر لو مش في الصفحة الأولى)
                  currentIndex > 0
                      ? TextButton(
                    onPressed: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Color(0xFFE2BE7F)),
                    ),
                  )
                      : const SizedBox(width: 50),

                  // النقاط (Dots Indicator)
                  // النقاط (Dots Indicator) 5 نقاط بالعدد
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length, // هيعمل 5 نقاط تلقائياً بناءً على عدد الشاشات في الـ List
                          (index) => buildDot(index, context),
                    ),
                  ),
                  
                  // زر Next أو Finish
                  TextButton(
                    onPressed: () {
                      if (currentIndex == contents.length - 1) {
                        // هنا بتكتبي الكود اللي ينقل المستخدم للـ Home Screen أو شاشة السبحة
                        // Navigator.pushReplacement(...)
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == contents.length - 1 ? "Finish" : "Next",
                      style: const TextStyle(
                        color: Color(0xFFE2BE7F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة لتصميم شكل النقطة (المؤشر) إذا كانت نشطة أو لا
  // دالة لتصميم شكل النقطة (المؤشر) وتغيير حجمها ولونها بناءً على الصفحة الحالية
  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // أنيميشن سلس لما النقطة تتحرك وتكبر
      height: 8,
      // لو النقطة هي الحالية، العرض بيكون 24 (مستطيل طويل)، ولو لا بيكون 8 (نقطة دائرية عادية)
      width: currentIndex == index ? 24 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: currentIndex == index
            ? const Color(0xFFE2BE7F) // اللون الذهبي للنقطة النشطة
            : const Color(0xFF707070), // اللون الرمادي للنقاط غير النشطة
      ),
    );
  }
}