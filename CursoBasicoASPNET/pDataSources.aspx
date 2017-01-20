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
                UpdateCommand="UPDATE Usuarios SET Login = @Login WHERE UsuarioId = @UsuarioId"
                InsertCommand="INSERT INTO Usuarios (Login, senha) VALUES (@Login, @senha)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GVUsuarios" Name="UsuarioId" PropertyName="SelectedValue" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Login" Type="String" />
                    <asp:ControlParameter ControlID="GVUsuarios" Name="UsuarioId" PropertyName="SelectedValue" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Login" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GVUsuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="UsuarioId" DataSourceID="DsUsuarios" Width="100%" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="UsuarioId" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="UsuarioId" />

                    <%-- Aqui uso o controle BoundField Normal --%>
                    <asp:BoundField DataField="login" HeaderText="Login (BoundField)" SortExpression="descricao" />

                    <%--Aqui uso o mesmo controle acima transformado em um template field o que me garante maior nivel de personalização--%>
                    <asp:TemplateField HeaderText="Login (TemplateField)" SortExpression="Login">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Login") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# doUpper(Eval("Login").ToString()) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField CancelText="Cancelar" EditText="Editar" ShowEditButton="True" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Excluir c/ confirmação" ID="btnExcluir" CommandName="Delete"
                                OnClientClick="return confirm('Você tem certeza que deseja excluir?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField CommandName="Delete" Text="Excluir S/ Confirmação" ButtonType="Link" />
                </Columns>
                <%--<PagerStyle BackColor="#3333CC" ForeColor="White" />--%>
            </asp:GridView>
        </div>

        <br />
        <br />

        <div style="width: 600px; border: solid; border-color: antiquewhite; padding: 15px 15px 15px 15px">
            <h2>Novo Registro usando FormView</h2>
            <hr />
            <asp:FormView DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="UsuarioId" DataSourceID="DsUsuarios" Width="400px">
                <%--<EditItemTemplate>
                    UsuarioId:
                    <asp:Label ID="UsuarioIdLabel1" runat="server" Text='<%# Eval("UsuarioId") %>' />
                    <br />
                    Login:
                    <asp:TextBox ID="LoginTextBox" runat="server" Text='<%# Bind("Login") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>--%>
                <InsertItemTemplate>
                    Login:
                    <asp:TextBox ID="LoginTextBox" runat="server" Text='<%# Bind("Login") %>' Width="300px" />
                    <br />
                    <br />
                    Senha:
                    <asp:TextBox TextMode="Password" ID="SenhaTextBx" runat="server" Text='<%# Bind("Senha") %>' Width="300px" />
                    <br />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Salvar" />
                    &nbsp;
                    <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </InsertItemTemplate>
                <%-- <ItemTemplate>
                    UsuarioId:
                    <asp:Label ID="UsuarioIdLabel" runat="server" Text='<%# Eval("UsuarioId") %>' />
                    <br />
                    Login:
                    <asp:Label ID="LoginLabel" runat="server" Text='<%# Bind("Login") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                </ItemTemplate>--%>
            </asp:FormView>
        </div>
        <hr />
        <div id="dvRepeater">
            <h2>Criando uma lista com o componente Repeater</h2>
            <asp:Repeater runat="server" DataSourceID="DsUsuarios">
                <HeaderTemplate>
                    <table style="border:1px solid black">
                        <tr>
                            <th style="width:100px;text-align:left">UsuarioId</th>
                            <th style="text-align:left">Login</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("UsuarioId") %></td>
                        <td><%# Eval("Login") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

    </form>
</body>
</html>
