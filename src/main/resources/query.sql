SELECT
    dt,
    ([Цена] * [Объём]) AS [Маржинальный доход],
    [Выручка за электроэнергию],
    [Цена],
    [Объём],
    ([Объём РСВ] * [Цена РСВ] / 1000) AS [Выручка за электроэнергию перепродажа],
    [Цена РСВ],
    [Объём РСВ],
    ([Объём БР] * [Цена БР] / 1000) AS [Покупка электроэнергии перепродажа],
    [Цена БР],
    [Объём БР]
FROM (SELECT
        ([Выручка за электроэнергию перепродажа] + [Покупка электроэнергии перепродажа]) AS [Выручка за электроэнергию],
        (([Цена БР] + [Цена РСВ])/2) AS [Цена],
        ([Объём РСВ] + [Объём БР]) AS [Объём],
        *
    FROM (SELECT
        dt,
        ([Объём] * [Цена РСВ] / 1000) AS [Выручка за электроэнергию перепродажа],
        [Цена РСВ] AS [Цена РСВ],
        [Объём] AS [Объём РСВ],
        ([Объём] * [Цена БР] / 1000) AS [Покупка электроэнергии перепродажа],
        [Цена БР] AS [Цена БР],
        [Объём] AS [Объём БР]
        FROM (SELECT
            CAST(table1.dt AS DATE) AS dt,
            SUM([v]) AS [Объём],
            SUM([v] * [Цена РСВ])/(SUM([v])) AS [Цена РСВ],
            SUM([v] * [m])/(SUM([v])) AS [Цена БР]
                FROM __exercise_table AS table1
                JOIN (SELECT dt, ABS(ISNULL([ИВ1-], 0) + ISNULL([ИВС-], 0)) AS [v] FROM __exercise_table) AS table2 ON table1.dt = table2.dt
                JOIN (SELECT dt, (SELECT MIN(m) FROM (VALUES ([ИБР]), ([Ц заявки])) T(m)) AS [m] FROM __exercise_table) AS table3 ON table1.dt = table3.dt
                GROUP BY CAST(table1.dt AS DATE)
        ) AS preresult
    ) AS resale
) AS income

