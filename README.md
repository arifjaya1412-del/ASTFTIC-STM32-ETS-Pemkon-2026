# ASTFTIC - Adaptive Sampling and Two-Layer Filtered Temperature Intelligent Control

**Evaluasi Tengah Semester (ETS) - Mata Kuliah Pemrograman Kontroler**  
**Fakultas Vokasi - Institut Teknologi Sepuluh Nopember (ITS)**

### 👥 Tim Pengembang (Disusun Oleh):
1. **Arif Jaya Mulia Simangunsong** (2042241087)
2. **Andhika Dwi Putra Gunawilaga** (2042241091)

---

### 📖 Deskripsi Proyek
Proyek ini mengusulkan sebuah metode baru bernama **ASTFTIC** (*Adaptive Sampling and Two-Layer Filtered Temperature Intelligent Control*). Sistem ini dirancang sebagai *embedded system* yang handal dengan menggabungkan keamanan tingkat perangkat keras, pemrosesan sinyal digital adaptif, dan algoritma kontrol suhu cerdas berbasis prediksi (Explicit MPC). 

Sistem disimulasikan secara *mixed-mode* menggunakan mikrokontroler **STM32F401VE** (ARM Cortex-M4) pada platform simulasi elektronika.

### 🌟 Fitur Utama Arsitektur (Empat Lapisan)
1. **Trusted Virtual Hardware Layer:** Implementasi simulasi *Secure Boot* berbasis CRC32 dan isolasi bus periferal tingkat rangkaian virtual.
2. **Firmware Core:** Berjalan di atas **FreeRTOS** dengan penjadwalan *preemptive*, diimplementasikan murni menggunakan bahasa C secara berlapis.
3. **Adaptive Control & Estimation:** Menggunakan sistem *Two-Layer Filter* (Simulasi Rangkaian RC Filter pasif + Software FIR Filter Orde-16) yang terbukti mereduksi *noise* pembacaan virtual sensor **LM35 hingga 87.5%**, dipadukan dengan kontrol prediktif *Explicit MPC* berkecepatan komputasi ekstra tinggi (< 8 mikrodetik).
4. **Trusted Multi-Protocol:** Transmisi serial diamankan dengan otentikasi pesan menggunakan **HMAC-SHA256** agar aman dari intervensi tak bertanggung jawab.

### 🛠️ Lingkungan Pengembangan & Komponen
- **IDE & Bahasa:** STM32CubeIDE (C Language)
- **Mikrokontroler:** STM32F401VET6
- **Simulator Hardware:** Proteus Professional 8.x
- **Sensor Suhu:** LM35
- **Analisis Grafik:** GNU Plot

---
*Repositori ini menampung seluruh berkas pendukung mulai dari laporan (LaTeX/PDF), gambar rangkaian, flowchart, hingga script plotting grafik.*
