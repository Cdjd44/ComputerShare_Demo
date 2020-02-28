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

    <div class="row">
        <div class="col-12 col-md-6 offset-md-3">
            <div class="jumbotron">
                <div class="row text-center">
                    <div class="col-12">
                        <h3>File 1</h3>
                    </div>
                </div>

                <div class="row text-center">
                    <div class="col-12">
                        <asp:Button ID="btnLoadFile1" runat="server" Text="Load File 1" CssClass="btn btn-info" OnClick="btnLoadFile1_Click"></asp:Button>
                    </div>
                </div>

                <div class="row text-center m-3">
                    <div class="col-12">
                        <asp:Button ID="btnBestBuyAndSellFile1" runat="server" Text="Find best Buy/Sell day" Visible="false" CssClass="btn btn-success" OnClick="btnBestBuyAndSellFile1_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-6 offset-md-3">
            <div class="jumbotron">
                <div class="row text-center">
                    <div class="col-12">
                        <h3>File 2</h3>
                    </div>
                </div>

                <div class="row text-center">
                    <div class="col-12">
                        <asp:Button ID="btnLoadFile2" runat="server" Text="Load File 2" CssClass="btn btn-info" OnClick="btnLoadFile2_Click"></asp:Button>
                    </div>
                </div>

                <div class="row text-center m-3">
                    <div class="col-12">
                        <asp:Button ID="btnBestBuyAndSellFile2" runat="server" Text="Find best Buy/Sell day" Visible="false" CssClass="btn btn-success" OnClick="btnBestBuyAndSellFile2_Click"></asp:Button>
                    </div>
                </div>
            </div>
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
                                    <ul class="days" runat="server">
                                        <li id="f1Li1" runat="server">1</li>
                                        <li id="f1Li2" runat="server">2</li>
                                        <li id="f1Li3" runat="server">3</li>
                                        <li id="f1Li4" runat="server">4</li>
                                        <li id="f1Li5" runat="server">5</li>
                                        <li id="f1Li6" runat="server">6</li>
                                        <li id="f1Li7" runat="server">7</li>
                                        <li id="f1Li8" runat="server">8</li>
                                        <li id="f1Li9" runat="server">9</li>
                                        <li id="f1Li10" runat="server">10</li>
                                        <li id="f1Li11" runat="server">11</li>
                                        <li id="f1Li12" runat="server">12</li>
                                        <li id="f1Li13" runat="server">13</li>
                                        <li id="f1Li14" runat="server">14</li>
                                        <li id="f1Li15" runat="server">15</li>
                                        <li id="f1Li16" runat="server">16</li>
                                        <li id="f1Li17" runat="server">17</li>
                                        <li id="f1Li18" runat="server">18</li>
                                        <li id="f1Li19" runat="server">19</li>
                                        <li id="f1Li20" runat="server">20</li>
                                        <li id="f1Li21" runat="server">21</li>
                                        <li id="f1Li22" runat="server">22</li>
                                        <li id="f1Li23" runat="server">23</li>
                                        <li id="f1Li24" runat="server">24</li>
                                        <li id="f1Li25" runat="server">25</li>
                                        <li id="f1Li26" runat="server">26</li>
                                        <li id="f1Li27" runat="server">27</li>
                                        <li id="f1Li28" runat="server">28</li>
                                        <li id="f1Li29" runat="server">29</li>
                                        <li id="f1Li30" runat="server">30</li>
                                    </ul>

                                    <ul class="days col-12">
                                        <li class="buy ml-3">Buy</li>
                                        <li class="sell ml-3">Sell</li>
                                    </ul>


                                </div>


                            </div>
                        </div>
                    </div>
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
                                    <ul class="days" runat="server">
                                        <li id="f2Li1" runat="server">1</li>
                                        <li id="f2Li2" runat="server">2</li>
                                        <li id="f2Li3" runat="server">3</li>
                                        <li id="f2Li4" runat="server">4</li>
                                        <li id="f2Li5" runat="server">5</li>
                                        <li id="f2Li6" runat="server">6</li>
                                        <li id="f2Li7" runat="server">7</li>
                                        <li id="f2Li8" runat="server">8</li>
                                        <li id="f2Li9" runat="server">9</li>
                                        <li id="f2Li10" runat="server">10</li>
                                        <li id="f2Li11" runat="server">11</li>
                                        <li id="f2Li12" runat="server">12</li>
                                        <li id="f2Li13" runat="server">13</li>
                                        <li id="f2Li14" runat="server">14</li>
                                        <li id="f2Li15" runat="server">15</li>
                                        <li id="f2Li16" runat="server">16</li>
                                        <li id="f2Li17" runat="server">17</li>
                                        <li id="f2Li18" runat="server">18</li>
                                        <li id="f2Li19" runat="server">19</li>
                                        <li id="f2Li20" runat="server">20</li>
                                        <li id="f2Li21" runat="server">21</li>
                                        <li id="f2Li22" runat="server">22</li>
                                        <li id="f2Li23" runat="server">23</li>
                                        <li id="f2Li24" runat="server">24</li>
                                        <li id="f2Li25" runat="server">25</li>
                                        <li id="f2Li26" runat="server">26</li>
                                        <li id="f2Li27" runat="server">27</li>
                                        <li id="f2Li28" runat="server">28</li>
                                        <li id="f2Li29" runat="server">29</li>
                                        <li id="f2Li30" runat="server">30</li>
                                    </ul>
                                </div>
                                <ul class="days col-12">
                                        <li class="buy ml-3">Buy</li>
                                        <li class="sell ml-3">Sell</li>
                                    </ul>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%--File2 Data Modal end--%>
    </div>
</asp:Content>
