<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Demo.Master" AutoEventWireup="true" CodeBehind="Fancy.aspx.cs" Inherits="ComputerShare_Demo.WebPages.Fancy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="../Style/Custom.css" />

    <script type="text/javascript">
        function openFile1RawModal() {
            $('#File1RawModal').modal('show');
        }

        function openFile2RawModal() {
            $('#File2RawModal').modal('show');
        }

        function openFile1Modal() {
            $('#File1Modal').modal('show');
        }

        function openFile2Modal() {
            $('#File2Modal').modal('show');
        }

        function setBuyingDay(day) {
            if (day === undefined) {
                return;
            }
            $(day).addClass('buy');
        }

        function setSellingDay(day) {
            if (day === undefined) {
                return;
            }
            $(day).addClass('sell');
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">



    <div class="row">
        <div class="col-12 col-md-6 offset-md-3">
            <div class="jumbotron">
                <div class="row text-center">
                    <div class="col-12">
                        <h1>Fancy Demo</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row m-3">
        <div class="col-12 col-md-6 offset-md-3">
            <!-- TradingView Widget BEGIN -->
            <div class="tradingview-widget-container">
                <div class="tradingview-widget-container__widget"></div>
                <div class="tradingview-widget-copyright"><a href="https://uk.tradingview.com" rel="noopener" target="_blank"><span class="blue-text">Quotes</span></a> by TradingView</div>
                <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-tickers.js" async>
          {
          "symbols": [
            {
              "description": "Computershare",
              "proName": "ASX:CPU"
            },
            {
              "description": "EUR/USD",
              "proName": "FX_IDC:EURUSD"
            }
          ],
          "colorTheme": "dark",
          "isTransparent": false,
          "locale": "uk"
        }
                </script>
            </div>
            <!-- TradingView Widget END -->
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-6 offset-md-3">
            <div class="jumbotron">
                <div class="row text-center">
                    <div class="col-6">
                        <h3>File 1</h3>
                    </div>
                    <div class="col-6">
                        <h3>File 2</h3>
                    </div>
                </div>

                <div class="row text-center mb-3">
                    <div class="col-6">
                        <asp:Button ID="btnLoadFile1" runat="server" Text="Load File 1" CssClass="btn btn-info" OnClick="btnLoadFile1_Click"></asp:Button>
                    </div>

                    <div class="col-6">
                        <asp:Button ID="btnLoadFile2" runat="server" Text="Load File 2" CssClass="btn btn-info" OnClick="btnLoadFile2_Click"></asp:Button>
                    </div>
                </div>

                <div class="row text-center">
                    <div class="col-6">
                        <asp:Button ID="btnBestBuyAndSellFile1" runat="server" Text="Find best Buy/Sell day" Visible="false" CssClass="btn btn-success" OnClick="btnBestBuyAndSellFile1_Click"></asp:Button>
                    </div>

                    <div class="col-6">
                        <asp:Button ID="btnBestBuyAndSellFile2" runat="server" Text="Find best Buy/Sell day" Visible="false" CssClass="btn btn-success" OnClick="btnBestBuyAndSellFile2_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row m-3">
        <div class="col-12 col-md-6 offset-md-3" style="height: 550px;">

            <!-- TradingView Widget BEGIN -->
            <div class="tradingview-widget-container">
                <div id="tradingview_9d693"></div>
                <div class="tradingview-widget-copyright"><a href="https://uk.tradingview.com/symbols/AAPL/" rel="noopener" target="_blank"><span class="blue-text">Apple</span></a>, <a href="https://uk.tradingview.com/symbols/GOOGL/" rel="noopener" target="_blank"><span class="blue-text">Google</span></a> <span class="blue-text">and</span> <a href="https://uk.tradingview.com/symbols/MSFT/" rel="noopener" target="_blank"><span class="blue-text">Microsoft Quotes</span></a> by TradingView</div>
                <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                <script type="text/javascript">
                    new TradingView.MediumWidget(
                        {
                            "symbols": [
                                [
                                    "Computershare",
                                    "ASX:CPU|1m"
                                ],
                                [
                                    "Apple",
                                    "AAPL|1m"
                                ],
                                [
                                    "Google",
                                    "GOOGL|1m"
                                ],
                                [
                                    "Microsoft",
                                    "MSFT|1m"
                                ] 
                            ],
                            "chartOnly": false,
                            "width": "100%",
                            "height": "100%",
                            "locale": "uk",
                            "colorTheme": "light",
                            "gridLineColor": "rgba(101, 101, 101, 1)",
                            "trendLineColor": "#2196f3",
                            "fontColor": "rgba(66, 66, 66, 1)",
                            "underLineColor": "rgba(207, 226, 243, 1)",
                            "isTransparent": false,
                            "autosize": true,
                            "container_id": "tradingview_9d693"
                        }
                    );
                </script>
            </div>
            <!-- TradingView Widget END -->

        </div>
    </div>




    <div class="row">
        <%--File1 Raw Data Modal--%>
        <div id="File1RawModal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row w-100">
                            <div class="col-3">
                                <i class="fa fa-file-text-o" aria-hidden="true"></i>
                            </div>
                            <div class="col-8">
                                <h5 class="modal-title">File 1 Raw Data</h5>
                            </div>
                            <div class="col-1">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="modal-body">
                        <div class="row p-2">
                            <asp:Label ID="lblFile1ModalLabel" runat="server" Text="Raw Data:" CssClass="col-12"></asp:Label>
                        </div>
                        <div class="row p-2 mb-3">
                            <asp:Label ID="lblFile1ModalBody" runat="server" CssClass="col-12"></asp:Label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%--File1 Raw Data Modal end--%>
    </div>

    <div class="row">
        <%--File1 Data Modal--%>
        <div id="File1Modal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row w-100">
                            <div class="col-3">
                                <i class="fa fa-file-text-o" aria-hidden="true"></i>
                            </div>
                            <div class="col-8">
                                <h5 class="modal-title">File 1 Buy and Sell Days</h5>
                            </div>
                            <div class="col-1">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="pnlFile1Body" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="calendar">
                                            <div class="month">
                                                <ul>
                                                    <li>File 1<br>
                                                        <span style="font-size: 18px">2020</span></li>
                                                </ul>
                                            </div>

                                            <ul class="weekdays">
                                                <li>Mo</li>
                                                <li>Tu</li>
                                                <li>We</li>
                                                <li>Th</li>
                                                <li>Fr</li>
                                                <li>Sa</li>
                                                <li>Su</li>
                                            </ul>
                                            <ul id="file1days" class="days" runat="server"></ul>

                                            <ul class="days col-12">
                                                <li class="buy ml-3">Buy</li>
                                                <li class="sell ml-3">Sell</li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="row m-3">
                                        <div class="col-12 col-md-6">
                                            <asp:Label ID="lblLowestPriceInMonth1" runat="server"></asp:Label>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <asp:Label ID="lblHighestPriceInMonth1" runat="server"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row m-3 mt-0">
                                        <div class="col-12">
                                            <asp:Label ID="lblBestDayToBuyMonth1" runat="server"></asp:Label>
                                        </div>

                                        <div class="col-12">
                                            <asp:Label ID="lblBestDayToSellMonth1" runat="server"></asp:Label>
                                        </div>

                                        <div class="col-12">
                                            <asp:Label ID="lblTotalProfitMonth1" runat="server"></asp:Label>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%--File1 Data Modal end--%>
    </div>

    <div class="row">
        <%--File2 Raw Data Modal--%>
        <div id="File2RawModal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row w-100">
                            <div class="col-3">
                                <i class="fa fa-file-text-o" aria-hidden="true"></i>
                            </div>
                            <div class="col-8">
                                <h5 class="modal-title">File 2 Raw Data</h5>
                            </div>
                            <div class="col-1">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="modal-body">
                        <div class="row p-2">
                            <asp:Label ID="lblFile2ModalLabel" runat="server" Text="Raw Data:" CssClass="col-12"></asp:Label>
                        </div>
                        <div class="row p-2 mb-3">
                            <asp:Label ID="lblFile2ModalBody" runat="server" CssClass="col-12"></asp:Label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%--File2 Raw Data Modal end--%>
    </div>

    <div class="row">
        <%--File2 Data Modal--%>
        <div id="File2Modal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row w-100">
                            <div class="col-3">
                                <i class="fa fa-file-text-o" aria-hidden="true"></i>
                            </div>
                            <div class="col-8">
                                <h5 class="modal-title">File 2 Buy and Sell Days</h5>
                            </div>
                            <div class="col-1">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <asp:UpdatePanel ID="pnlFile2Body" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>


                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-12">

                                        <div class="calendar">
                                            <div class="month">
                                                <ul>
                                                    <li>File 2<br>
                                                        <span style="font-size: 18px">2020</span></li>
                                                </ul>
                                            </div>

                                            <ul class="weekdays">
                                                <li>Mo</li>
                                                <li>Tu</li>
                                                <li>We</li>
                                                <li>Th</li>
                                                <li>Fr</li>
                                                <li>Sa</li>
                                                <li>Su</li>
                                            </ul>
                                            <ul id="file2days" class="days" runat="server"></ul>
                                        </div>
                                        <ul class="days col-12">
                                            <li class="buy ml-3">Buy</li>
                                            <li class="sell ml-3">Sell</li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row m-3">
                                    <div class="col-12 col-md-6">
                                        <asp:Label ID="lblLowestPriceInMonth2" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <asp:Label ID="lblHighestPriceInMonth2" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="row m-3 mt-0">
                                    <div class="col-12">
                                        <asp:Label ID="lblBestDayToBuyMonth2" runat="server"></asp:Label>
                                    </div>

                                    <div class="col-12">
                                        <asp:Label ID="lblBestDayToSellMonth2" runat="server"></asp:Label>
                                    </div>

                                    <div class="col-12">
                                        <asp:Label ID="lblTotalProfitMonth2" runat="server"></asp:Label>
                                    </div>


                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%--File2 Data Modal end--%>
    </div>
</asp:Content>
