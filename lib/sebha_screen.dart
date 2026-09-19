import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int dhikrIndex = 0;
  double turns = 0.0;

  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله"
  ];

  void incrementCounter() {
    setState(() {
      counter++;
      turns += 0.1;
      if (counter > 33) {
        counter = 0;
        dhikrIndex = (dhikrIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: Stack(
        children: [
          // 1. صورة الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. طبقة تغميق (Overlay) عشان الخلفية تظهر داكنة ومش باينة أوي زي الفيجما
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.75), // تحكم في درجة الغماق من هنا (كل ما زادت النسبة كل ما بقت أغمق)
            ),
          ),

// 3. محتوى الصفحة الأساسي
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                // كلمة إسلامي في الأعلى
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.asset(
                    'assets/images/islami.png', // تأكدي إن اسم صورة اللوجو عندك كده بالضبط
                    height: 120, // يمكنك تصغير أو تكبير الارتفاع حسب ما يناسب شاشتك
                    fit: BoxFit.contain,
                  ),
                ),

                // الجملة اللي فوق السبحة
                const Text(
                  'سبِّح اسم ربّكَ الأعلي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),

                // تصميم السبحة (الرأس والجسم المتحرك)
                Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 420,
                      width: 300,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // رأس السبحة الثابت
                          Positioned(
                            top: 0,
                            child: Image.asset(
                              'assets/images/sebha_head.png',
                              height: 90,
                            ),
                          ),

                          // جسم السبحة المتحرك عند الضغط
                          Positioned(
                            top: 55,
                            child: GestureDetector(
                              onTap: incrementCounter,
                              child: AnimatedRotation(
                                turns: turns,
                                duration: const Duration(milliseconds: 300),
                                child: Image.asset(
                                  'assets/images/sebha_body.png',
                                  height: 280,
                                ),
                              ),
                            ),
                          ),

                          // العداد ونص الذكر في المنتصف تماماً
                          Positioned(
                            top: 160,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  azkar[dhikrIndex],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '$counter',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}