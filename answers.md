# Lab L1 · answers.md (TH)

ชื่อ-สกุล: สุทธิวงค์ ทิพย์มาก (Sutthiwong Thipmak)
รหัสนักศึกษา: 67122663
ลิงก์ repo: https://github.com/sutthiwong/lab01_profile

## Q1 · เครื่องมือ
ใน `flutter doctor` พบว่า Flutter อยู่ที่ `Channel [user-branch]` (3.47.7) และไม่พบ `Visual Studio` (Desktop development with C++) สำหรับพัฒนาแอปบน Windows แต่ส่วนของ Android toolchain (`Android SDK version 36.0.0`) และ Connected device (`Medium_Phone_API_37.0` / `emulator-5554`) พร้อมใช้งานสำหรับการรันบน Android Emulator แล้ว โดยอ้างอิงคู่มือตั้งค่าทางการของ Flutter ที่ `https://flutter.dev/setup/` (เช่น การตรวจสอบ channel/SDK และติดตั้งเครื่องมือที่จำเป็นตามหมวดที่ต้องการ)

## Q2 · Reload
เมื่อ `Likes` เป็น `3` อยู่:
- กด **`r` (Hot Reload)**: ค่า `Likes` ยังคงเป็น **`3`** เหมือนเดิม เพราะ Hot Reload จะฉีดโค้ดที่อัปเดตเข้าไปและเรียก `build()` ใหม่โดยยังคงรักษา `State` (`_HomePageState` และค่า `_likes` ในหน่วยความจำ) เอาไว้
- กด **`R` (Hot Restart)**: ค่า `Likes` จะรีเซ็ตกลับเป็น **`0`** เพราะ Hot Restart จะทำลาย State เดิมทั้งหมด รีเซ็ตตัวแปรในหน่วยความจำ และเริ่มสร้างแอปและ State ใหม่ตั้งแต่ต้น

## Q3 · โค้ดและ Git
`_likes++` ต้องอยู่ใน `setState` เพราะการเพิ่มค่าตัวแปร `_likes` เฉย ๆ ไม่ได้แจ้งให้ Flutter ทราบว่า State เปลี่ยนแปลงไป ทำให้เมธอด `build()` ไม่ถูกเรียกซ้ำและหน้าจอไม่แสดงตัวเลขใหม่ การเรียก `setState(() => _likes++)` จะอัปเดตค่าและสั่งให้ Flutter mark widget เป็น dirty เพื่อเรียก `build()` วาด UI ใหม่ทันที

ตัวอย่าง commit: `git commit -am "Add like counter with setState"`
สิ่งที่เปลี่ยน: เปลี่ยน `HomePage` เป็น `StatefulWidget` พร้อม `_HomePageState` ที่มีตัวแปร `_likes` และเมธอด `_like()` ใช้ `setState` รวมถึงเพิ่ม `Text('Likes: $_likes')` และปุ่ม `FilledButton` ชื่อ `Like` ใน `lib/main.dart`

## ตารางทดสอบ

| ประเภท | input หรือการกระทำ | ผลที่คาดหวัง | ผลจริง |
|---|---|---|---|
| Normal | เปิดแอป | title มีรหัส ไอคอน ชื่อ “Likes: 0” | แสดง title `Lab L1 · 67122663`, ไอคอนคน, ชื่อ-รหัส และ `Likes: 0` ตามคาด |
| Normal | กด Like หนึ่งครั้ง | “Likes: 1” | แสดง `Likes: 1` |
| Boundary | กด Like เร็ว ๆ 20 ครั้ง | “Likes: 20” ไม่มี error | ค่าเพิ่มจนถึง `Likes: 20` โดยไม่มี error |
| Boundary | หมุนจอเป็นแนวนอน | ยังอยู่กลางจอ ไม่ overflow | เนื้อหายังอยู่กึ่งกลางหน้าจอและไม่เกิด overflow |
| Reload | กด 3 ครั้ง แล้ว r แล้ว R | หลัง r ได้ 3 · หลัง R ได้ 0 | หลังกด `r` ยังได้ `3` และหลังกด `R` รีเซ็ตเป็น `0` |
| Failure | ปิด emulator แล้ว `flutter run` | “No supported devices connected.” | แจ้งว่าไม่มีอุปกรณ์ที่รองรับเชื่อมต่ออยู่ (`No supported devices connected.`) |

## การใช้ AI
ใช้ Gemini ช่วยแนะนำขั้นตอนการทำแล็บ อธิบายการทำงานของ `flutter doctor`, Hot Reload (`r`) vs Hot Restart (`R`), `StatefulWidget` กับ `setState`, การใช้ Git และช่วยร่างคำตอบลงใน `answers.md`