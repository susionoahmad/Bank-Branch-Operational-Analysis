SELECT 
    service_type,
    EXTRACT(HOUR FROM TIMESTAMP(arrival_time)) AS jam_datang,
    AVG(TIMESTAMP_DIFF(TIMESTAMP(start_time), TIMESTAMP(arrival_time), MINUTE)) AS waktu_tunggu_menit
FROM `dataanalyst-496415.banking_analysis.operasional_cabang`
GROUP BY service_type, jam_datang
HAVING waktu_tunggu_menit > 20
ORDER BY waktu_tunggu_menit DESC;
