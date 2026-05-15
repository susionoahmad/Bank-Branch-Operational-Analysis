# Bank-Branch-Operational-Analysis
# 🏦 Bank Branch Operational Analysis

## 📌 Project Overview
Analisis ini berfokus pada efisiensi operasional kantor cabang perbankan dengan mengevaluasi korelasi antara volume kedatangan nasabah, waktu tunggu, dan skor kepuasan.

## 🛠️ Tech Stack
- **Database:** Google BigQuery (SQL)
- **Visualisasi:** Google Looker Studio
- **Metrics:** Waiting Time, Service Duration, Customer Satisfaction Score (CSAT).

## 🔍 Key Insights
1. **Identifikasi Rush Hour:** Meskipun volume nasabah tertinggi ada di jam 09:00, waktu tunggu terlama terjadi pada jam 12:00 (jam istirahat).
2. **Impact Analysis:** Terdapat korelasi negatif yang kuat; setiap peningkatan waktu tunggu di atas 15 menit menurunkan skor kepuasan nasabah sebesar 40%.
3. **Staff Performance:** Berhasil mengidentifikasi perbedaan efisiensi antar petugas untuk optimalisasi jadwal kerja.

## 📄 SQL Query Utama
```sql
SELECT 
    EXTRACT(HOUR FROM TIMESTAMP(arrival_time)) AS jam_kedatangan,
    COUNT(transaction_id) AS jumlah_nasabah, 
    AVG(TIMESTAMP_DIFF(TIMESTAMP(start_time), TIMESTAMP(arrival_time), MINUTE)) AS rata_rata_tunggu_menit,
    AVG(satisfaction_score) AS skor_kepuasan
FROM `dataanalyst-496415.banking_analysis.operasional_cabang`
GROUP BY jam_kedatangan
ORDER BY jam_kedatangan;
