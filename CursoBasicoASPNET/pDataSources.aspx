<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pDataSources.aspx.cs" Inherits="CursoBasicoASPNET.pDataSources" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Usuários Cadastrados</h2>
        <div>    
            <asp:SqlDataSource ID="DsUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                SelectCommand="SELECT [UsuarioId], [Login] FROM [Usuarios]" 
                DeleteCommand="DELETE FROM [Usuarios] Where [UsuarioId] = @UsuarioId"
                UpdateCommand="UPDATE Usuarios SET Login = @Login WHERE UsuarioId = @UsuarioId">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GVUsuarios" Name="UsuarioId" PropertyName="SelectedValue" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Login" Type="String" />
                    <asp:ControlParameter ControlID="GVUsuarios" Name="UsuarioId" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GVUsuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="UsuarioId" DataSourceID="DsUsuarios" Width="100%" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="UsuarioId" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="UsuarioId" />
                    <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                    <asp:CommandField CancelText="Cancelar" EditText="Editar" ShowEditButton="True" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Excluir c/ confirmação" ID="btnExcluir" CommandName="Delete"
                                OnClientClick="return confirm('Você tem certeza que deseja excluir?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField CommandName="Delete" Text="Excluir S/ Confirmação" ButtonType="Link" />
                </Columns>
                <PagerStyle BackColor="#3333CC" ForeColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
