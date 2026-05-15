SELECT 
    EXTRACT(HOUR FROM TIMESTAMP(arrival_time)) AS jam_kedatangan,
    -- Tambahkan baris di bawah ini --
    COUNT(transaction_id) AS jumlah_nasabah, 
    AVG(TIMESTAMP_DIFF(TIMESTAMP(start_time), TIMESTAMP(arrival_time), MINUTE)) AS rata_rata_tunggu_menit,
    AVG(satisfaction_score) AS skor_kepuasan
FROM `dataanalyst-496415.banking_analysis.operasional_cabang`
GROUP BY jam_kedatangan
ORDER BY jam_kedatangan;
