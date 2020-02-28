<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Demo.Master" AutoEventWireup="true" CodeBehind="Fancy.aspx.cs" Inherits="ComputerShare_Demo.WebPages.Fancy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="../Style/Custom.css" />

    <script type="text/javascript">
        function openModal() {
            $('#File1Modal').modal('show');
        }

        $(function () {
            $("#datepicker").datepicker();
        });
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
                        <asp:Button ID="btnBestBuyAndSellFile1" runat="server" Text="Find best Buy/Sell day" CssClass="btn btn-success"></asp:Button>
                    </div>
                </div>

                <asp:UpdatePanel ID="pnlBuySellFile1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="row text-center">
                            <div class="col-12">
                                <asp:Label ID="lblFile1Results" runat="server" Text="Results:"></asp:Label>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>



            </div>
        </div>
    </div>


    <%--File1 Raw Data Modal--%>
    <div id="File1Modal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row w-100">
                        <div class="col-4">
                            <i class="fa fa-file-text-o" aria-hidden="true"></i>
                        </div>
                        <div class="col-7">
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

                    <div class="row">
                        <div class="col-12">
                            <p>
                                Date:
                                <input type="text" id="datepicker">
                            </p>

                            <div class="calendar">
                                <div class="row">
                                    <div class="month">
                                        <ul>
                                            <li>File 1<br>
                                                <span style="font-size: 18px">2020</span></li>
                                        </ul>
                                    </div>
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

                                <ul class="days">
                                    <li>1</li>
                                    <li>2</li>
                                    <li>3</li>
                                    <li>4</li>
                                    <li>5</li>
                                    <li>6</li>
                                    <li>7</li>
                                    <li>8</li>
                                    <li>9</li>
                                    <li><span class="active">10</span></li>
                                    <li>11</li>
                                    <li>12</li>
                                    <li>13</li>
                                    <li>14</li>
                                    <li>15</li>
                                    <li>16</li>
                                    <li>17</li>
                                    <li>18</li>
                                    <li>19</li>
                                    <li><span class="active">20</span></li>
                                    <li>21</li>
                                    <li>22</li>
                                    <li>23</li>
                                    <li>24</li>
                                    <li>25</li>
                                    <li>26</li>
                                    <li>27</li>
                                    <li>28</li>
                                    <li>29</li>
                                    <li>30</li>
                                </ul>

                                <%--<div class="calendar__date">

                                    <div class="calendar__day">M</div>
                                    <div class="calendar__day">T</div>
                                    <div class="calendar__day">W</div>
                                    <div class="calendar__day">T</div>
                                    <div class="calendar__day">F</div>
                                    <div class="calendar__day">S</div>
                                    <div class="calendar__day">S</div>
                                    <div class="calendar__number"></div>
                                    <div class="calendar__number"></div>
                                    <div class="calendar__number"></div>
                                    <div class="calendar__number">1</div>
                                    <div class="calendar__number">2</div>
                                    <div class="calendar__number">3</div>
                                    <div class="calendar__number">4</div>
                                    <div class="calendar__number">5</div>
                                    <div class="calendar__number">6</div>
                                    <div class="calendar__number">7</div>
                                    <div class="calendar__number">8</div>
                                    <div class="calendar__number">9</div>
                                    <div class="calendar__number">10</div>
                                    <div class="calendar__number">11</div>
                                    <div class="calendar__number">12</div>
                                    <div class="calendar__number">13</div>
                                    <div class="calendar__number">14</div>
                                    <div class="calendar__number">15</div>
                                    <div class="calendar__number">16</div>
                                    <div class="calendar__number">17</div>
                                    <div class="calendar__number calendar__number">18</div>
                                    <div class="calendar__number">19</div>
                                    <div class="calendar__number">20</div>
                                    <div class="calendar__number">21</div>
                                    <div class="calendar__number">22</div>
                                    <div class="calendar__number">23</div>
                                    <div class="calendar__number">24</div>
                                    <div class="calendar__number">25</div>
                                    <div class="calendar__number">26</div>
                                    <div class="calendar__number">27</div>
                                    <div class="calendar__number">28</div>
                                    <div class="calendar__number">29</div>
                                    <div class="calendar__number">30</div>
                                </div>--%>
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
    <%--File1 Raw Data Modal end--%>
</asp:Content>
