<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Demo.Master" AutoEventWireup="true" CodeBehind="Fancy.aspx.cs" Inherits="ComputerShare_Demo.WebPages.Fancy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function openModal() {
            $('#File1Modal').modal('show');
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

                <asp:UpdatePanel ID="pnlFile1RawResults" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="row text-center">
                            <div class="col-12">
                                <asp:Label ID="lblFile1RawData" runat="server" Text="Raw Data:"></asp:Label>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="row text-center">
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


    <%--File1Modal--%>
    <div id="File1Modal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Modal body text goes here.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Save changes</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--File1Modal end--%>
</asp:Content>
