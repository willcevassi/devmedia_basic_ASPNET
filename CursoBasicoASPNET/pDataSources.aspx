<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pDataSources.aspx.cs" Inherits="CursoBasicoASPNET.pDataSources" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
        <h2>Usuários Cadastrados</h2>
        <div>
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
                <EditItemTemplate>
                    UsuarioId:
                    <asp:Label ID="UsuarioIdLabel1" runat="server" Text='<%# Eval("UsuarioId") %>' />
                    <br />
                    Login:
                    <asp:TextBox ID="LoginTextBox" runat="server" Text='<%# Bind("Login") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Login:
                    <asp:TextBox ID="LoginTextBox" runat="server" Text='<%# Bind("Login") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    UsuarioId:
                    <asp:Label ID="UsuarioIdLabel" runat="server" Text='<%# Eval("UsuarioId") %>' />
                    <br />
                    Login:
                    <asp:Label ID="LoginLabel" runat="server" Text='<%# Bind("Login") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </div>
        <hr />
        <div id="dvRepeater">
            <h2>Criando uma lista com o componente Repeater</h2>
            <asp:Repeater runat="server" DataSourceID="DsUsuarios">
                <HeaderTemplate>
                    <table style="border: 1px solid black">
                        <tr>
                            <th style="width: 100px; text-align: left">UsuarioId</th>
                            <th style="text-align: left">Login</th>
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

        <div id="dvListView">
            <h2>Usando o ListView</h2>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="DsUsuarios" DataKeyNames="UsuarioId" GroupItemCount="3">
                <AlternatingItemTemplate>
                    <td runat="server" style="background-color: #FFFFFF;color: #284775;">UsuarioId:
                        <asp:Label ID="UsuarioIdLabel" runat="server" Text='<%# Eval("UsuarioId") %>' />
                        <br />
                        Login:
                        <asp:Label ID="LoginLabel" runat="server" Text='<%# Eval("Login") %>' />
                        <br />
                    </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="background-color: #999999;">UsuarioId:
                        <asp:Label ID="UsuarioIdLabel1" runat="server" Text='<%# Eval("UsuarioId") %>' />
                        <br />
                        Login:
                        <asp:TextBox ID="LoginTextBox" runat="server" Text='<%# Bind("Login") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">Login:
                        <asp:TextBox ID="LoginTextBox" runat="server" Text='<%# Bind("Login") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="background-color: #E0FFFF;color: #333333;">UsuarioId:
                        <asp:Label ID="UsuarioIdLabel" runat="server" Text='<%# Eval("UsuarioId") %>' />
                        <br />
                        Login:
                        <asp:Label ID="LoginLabel" runat="server" Text='<%# Eval("Login") %>' />
                        <br />
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">UsuarioId:
                        <asp:Label ID="UsuarioIdLabel" runat="server" Text='<%# Eval("UsuarioId") %>' />
                        <br />
                        Login:
                        <asp:Label ID="LoginLabel" runat="server" Text='<%# Eval("Login") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>

    </form>
</body>
</html>
