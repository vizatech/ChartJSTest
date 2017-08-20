<%@ Page Title="ChartJS - Test" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="chartJSBarAndrew._Default" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2> Тестирование возможностей ChartJS <small>(передача групового признака из столбца диаграммы)</small></h2>
    <blockquote><p>просто кликните мышкой</p><p>в любой части столбца диаграммы</p></blockquote>
    <br />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
    <canvas id="createCurrYearHccGapChart" height="340" width="600" style="display: block; padding-top: 20px;"></canvas>
    <canvas id= "CurrentBarChartCanvas" height="200" width="600" style="display: block; padding-top: 20px;"></canvas>
    <script type="text/javascript">
        var BarChartVar = {
            type: 'bar',
            data: {
                labels: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
                datasets: [{
                    label: "2016 г",
                    backgroundColor: '#cc3399',
                    data: [10, 7, 6, 8, 6, 10, 3, 4, 2, 7, 10, 4]
                }, {
                    label: "2017 г.",
                    backgroundColor: '#0099ff',
                    data: [2, 9, 5, 8, 6, 10, 3, 6, 8, 6, 10, 3]
                }, {
                    label: "Прогноз на 2018г",
                    backgroundColor: '#0022ff',
                    data: [5, 7, 6, 8, 6, 10, 3, 8, 6, 10, 3, 6]
                }]
            },
            options: {
                responsive: false,
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        stacked: true
                    }],
                    xAxes: [{
                        stacked: true
                    }]
                },

            }
        }
        var CurrentBarChart;
        var canvas = document.getElementById('createCurrYearHccGapChart');
        var myChart = new Chart(canvas, BarChartVar);
        canvas.onclick = function (evt) {
            var activePoint = myChart.getElementAtEvent(evt)[0];
            var readdata = activePoint._chart.data;
            var datasetIndex = activePoint._datasetIndex;
            var readlabel = readdata.datasets[datasetIndex].label;

            var CurrentBarChartVar = {
                type: 'bar',
                data: {
                    labels: readdata.labels,
                    datasets: [{
                        label: readlabel,
                        backgroundColor: readdata.datasets[datasetIndex].backgroundColor,
                        data: readdata.datasets[datasetIndex].data
                    }]
                },
                options: {
                    responsive: false,
                    legend: {
                        display: false
                    },
                    scales: {
                        yAxes: [{
                            stacked: true
                        }],
                        xAxes: [{
                            stacked: true
                        }]
                    },
                }
            }
            var CurrentBarChartCanvas = document.getElementById('CurrentBarChartCanvas');
            if (CurrentBarChart != null) CurrentBarChart.destroy();
            CurrentBarChart = new Chart(CurrentBarChartCanvas, CurrentBarChartVar);
        };
    </script>

</asp:Content>
