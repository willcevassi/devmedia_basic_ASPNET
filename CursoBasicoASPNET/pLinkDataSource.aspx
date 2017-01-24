<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pLinkDataSource.aspx.cs" Inherits="CursoBasicoASPNET.pLinkDataSource" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h3>Usando Link DataSource</h3>
    <form id="form1" runat="server">
    <div>    
        <asp:LinqDataSource ID="DsProdutos" runat="server" ContextTypeName="CursoBasicoASPNET.NortwindLinkContextDataContext" EntityTypeName="" OrderBy="ProductName" Select="new (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)" TableName="Products" AutoGenerateWhereClause="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="txtBuscaNome" Name="ProductName" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        
    </div>
    <div id="dvFiltros" style="height:80px;vertical-align:middle;width:900px;">
        <fieldset>
            <legend>Filtros:</legend>
            <asp:TextBox ID="txtBuscaNome" runat="server" Width="440px"></asp:TextBox>
            <asp:Button ID="btnPesquisar" runat="server" OnClick="btnPesquisar_Click" Text="Pesquisar" />
        </fieldset>
    </div>

    <div id="dvGrid" style="width:900px;">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DsProdutos" ForeColor="#333333" GridLines="None" Width="900px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="#" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="Nomme" ReadOnly="True" SortExpression="ProductName" />
                <asp:BoundField DataField="QuantityPerUnit" HeaderText="Embalagem" ReadOnly="True" SortExpression="QuantityPerUnit" />
                <asp:BoundField DataField="UnitPrice" HeaderText="Preço Unitário" ReadOnly="True" SortExpression="UnitPrice" />
                <asp:BoundField DataField="UnitsInStock" HeaderText="Estoque" ReadOnly="True" SortExpression="UnitsInStock" />
                <asp:BoundField DataField="UnitsOnOrder" HeaderText="Reservado" ReadOnly="True" SortExpression="UnitsOnOrder" />
                <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" ReadOnly="True" SortExpression="ReorderLevel" />
                <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinuado" ReadOnly="True" SortExpression="Discontinued" />
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
    </div>
    </form>
</body>
</html>
