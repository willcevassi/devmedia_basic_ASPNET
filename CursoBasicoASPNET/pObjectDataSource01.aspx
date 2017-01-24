<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pObjectDataSource01.aspx.cs" Inherits="CursoBasicoASPNET.pObjectDataSource01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="dvFiltros" style="height:80px;vertical-align:middle">
            <fieldset>
                <legend>Filtros:</legend>
                <asp:TextBox ID="txtBuscaNome" runat="server" Width="440px"></asp:TextBox>
                <asp:Button ID="btnPesquisar" runat="server" OnClick="btnPesquisar_Click" Text="Pesquisar" />
            </fieldset>
        </div>


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="#" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="Nome" SortExpression="ProductName" />
                <asp:BoundField DataField="QuantityPerUnit" HeaderText="Embalagem" SortExpression="QuantityPerUnit" />
                <asp:BoundField DataField="UnitPrice" HeaderText="Preço Unit." SortExpression="UnitPrice" />
                <asp:BoundField DataField="UnitsInStock" HeaderText="Estoque" SortExpression="UnitsInStock" />
                <asp:BoundField DataField="UnitsOnOrder" HeaderText="Reservado" SortExpression="UnitsOnOrder" />
                <asp:CheckBoxField DataField="Discontinued" HeaderText="Descontinuado" SortExpression="Discontinued" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getProdutos" TypeName="CursoBasicoASPNET.NorthwindSambleContext01">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtBuscaNome" PropertyName="Text" Name="nome" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
