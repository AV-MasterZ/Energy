<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Кнопка с таблицей</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        #btn {
            display: block;
            margin: 30px auto;
            padding: 20px;
        }

        table {
            margin: auto;
            font-size: 16px;
            border-collapse: collapse;
        }

        table td, th {
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <button onclick="get();" id="btn">Кнопка</button>
    <div id="container" style="width: 100%;"></div>

    <script type="text/template" id="tmp">
        <table>
            <tr>
                <th>Дата</th>
                <th>Маржинальный доход</th>
                <th>Выручка за электроэнергию</th>
                <th>Цена</th>
                <th>Объём</th>
                <th>Выручка за электроэнергию перепродажа</th>
                <th>Цена РСВ</th>
                <th>Объём РСВ</th>
                <th>Покупка электроэнергии перепродажа</th>
                <th>Цена БР</th>
                <th>Объём БР</th>
            </tr>
    </script>

    <script>
        document.addEventListener("DOMContentLoaded",function() {
            let button = document.getElementById('btn');
            btn.addEventListener("click", function() {
                let request = new XMLHttpRequest();
                request.open('GET', '/table', true);
                request.addEventListener('readystatechange', function() {
                    if ((request.readyState==4) && (request.status==200)) {

                        let table = document.getElementById("tmp").textContent;

                        $.each(JSON.parse(request.responseText), function(key, value){

                            table += ('<tr>');
                            table += ('<td>' + value.date + '</td>');
                            table += ('<td>' + value.income + '</td>');
                            table += ('<td>' + value.energyIncome + '</td>');
                            table += ('<td>' + value.energyPrice + '</td>');
                            table += ('<td>' + value.energyVolume + '</td>');
                            table += ('<td>' + value.energyIncomeResale + '</td>');
                            table += ('<td>' + value.energyIncomeResalePrice + '</td>');
                            table += ('<td>' + value.energyIncomeResaleVolume + '</td>');
                            table += ('<td>' + value.buyIncomeResale + '</td>');
                            table += ('<td>' + value.buyIncomeResalePrice + '</td>');
                            table += ('<td>' + value.buyIncomeResaleVolume + '</td>');
                            table += ('</tr>');

                        });

                        table += '</table>';

                        let container = document.getElementById('container');
                        container.innerHTML = table;
                    }
                });
                request.send();
            });
        });
    </script>
</body>
</html>