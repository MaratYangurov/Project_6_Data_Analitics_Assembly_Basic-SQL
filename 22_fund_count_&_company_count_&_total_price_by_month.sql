/* 
«апрос є22. —водна€ таблица, состо€ща€ из:

номер мес€ца, в котором проходили раунды;
количество уникальных названий фондов из —Ўј, которые инвестировали в этом мес€це;
количество компаний, купленных за этот мес€ц;
обща€ сумма сделок по покупкам в этом мес€це.
ƒанные отобраны за период с 2010 по 2013 год, когда проходили инвестиционные раунды, и сгруппированы по номеру мес€ца.
*/

SELECT
    EXTRACT(MONTH FROM fr.funded_at) AS month_number,
    COUNT(DISTINCT f.name) AS unique_us_funds,
    COUNT(DISTINCT ac.acquired_company_id) AS companies_acquired,
    SUM(ac.price_amount) AS total_acquisition_amount
FROM funding_round AS fr
INNER JOIN investment AS i ON fr.id = i.funding_round_id
INNER JOIN fund AS f ON f.id = i.fund_id
LEFT JOIN acquisition AS ac ON EXTRACT(MONTH FROM ac.acquired_at) = EXTRACT(MONTH FROM fr.funded_at)
WHERE 
    EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2010 AND 2013
    AND f.country_code = 'USA'
GROUP BY month_number
ORDER BY month_number;