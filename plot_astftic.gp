# ==============================================================================
# SCRIPT GNUPLOT: Simulasi Transient Response Loop Tertutup ASTFTIC
# ==============================================================================

# Output configuration: PNG cairo dengan anti-aliasing tinggi
set terminal pngcairo size 900,600 font "Arial,11"
set output "grafik_respon_astftic.png"

# Konstanta Simulasi System
T_set = 45.0      # Setpoint Suhu Target (derajat C)
T_0 = 25.0        # Suhu Awal Ruangan (derajat C)
tau = 5.0         # Konstanta Waktu Thermal Sistem (detik)

# Fungsi Matematika Respons Sistem Laju Suhu orde-1
T(x) = T_set + (T_0 - T_set) * exp(-x/tau)

# Fungsi Sinyal Error (e = Setpoint - Suhu Aktual)
e(x) = T_set - T(x)

# Fungsi Logika Duty Cycle PWM TIM1 CH1 (20 C - 50 C)
Duty(x) = (T(x) <= 20.0) ? 0.0 : ((T(x) >= 50.0) ? 100.0 : (T(x) - 20.0) / 30.0 * 100.0)

# Warna Grafik (Modern Palette)
color_suhu  = "#E53935"  # Merah (Suhu)
color_error = "#8E24AA"  # Ungu (Error)
color_pwm   = "#1E88E5"  # Biru (PWM)

# Konfigurasi Border & Grid
set grid xtics ytics y2tics ls 0 lc rgb "#E0E0E0" lw 1
set border 11 lc rgb "#424242" lw 1.5   # Mengaktifkan border kiri, kanan, bawah
set tics nomirror tc rgb "#424242"

# Sumbu-X (Waktu dalam detik)
set xlabel "Waktu (detik)" font "Arial-Bold,11" tc rgb "#212121"
set xrange [0:25]
set xtics 0,5,25

# Sumbu-Y Kiri (Untuk Suhu dan Error dalam °C)
set ylabel "Suhu & Error ({/Symbol \260}C)" font "Arial-Bold,11" tc rgb "#212121"
set yrange [0:50]
set ytics 0,10,50
set format y "%.1f"

# Sumbu-Y Kanan (Untuk Duty Cycle PWM dalam %)
set y2label "Duty Cycle PWM (%)" font "Arial-Bold,11" tc rgb "#212121"
set y2range [0:100]
set y2tics 0,20,100
set format y2 "%.1f%%"

# Konfigurasi Judul & Legend
set title "Simulasi Transient Response Close Loop ASTFTIC\n(Setpoint = 45.0{/Symbol \260}C, Suhu Awal = 25.0{/Symbol \260}C)" font "Arial-Bold,13" tc rgb "#1A237E"
set key top right box lt 1 lc rgb "#E0E0E0" spacing 1.3

# Plot Grafik dengan Dual Axis (axes x1y1 dan axes x1y2)
plot T(x) axes x1y1 with lines title "Suhu Aktual T(t)" lc rgb color_suhu lw 3, \
     e(x) axes x1y1 with lines title "Sinyal Error e(t)" lc rgb color_error lw 2.5 dt 2, \
     Duty(x) axes x1y2 with lines title "Duty Cycle PWM (%)" lc rgb color_pwm lw 3
