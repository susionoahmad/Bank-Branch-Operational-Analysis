SELECT 
    staff_name,
    COUNT(transaction_id) AS total_nasabah,
    ROUND(AVG(TIMESTAMP_DIFF(TIMESTAMP(end_time), TIMESTAMP(start_time), MINUTE)), 1) AS rata_rata_durasi_layanan,
    ROUND(AVG(satisfaction_score), 2) AS rata_rata_kepuasan
FROM `dataanalyst-496415.banking_analysis.operasional_cabang`
GROUP BY staff_name
ORDER BY rata_rata_kepuasan DESC;
