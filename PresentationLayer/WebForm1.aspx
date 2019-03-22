<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PresentationLayer.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 49%;
            height: 272px;
            position: absolute;
            top: 62px;
            left: 363px;
            z-index: 1;
        }

        .auto-style2 {
            width: 303px;
        }

        .auto-style3 {
            width: 136px;
        }

        .auto-style4 {
            width: 136px;
            height: 38px;
        }

        .auto-style5 {
            width: 303px;
            height: 38px;
        }
        .cal{
             position: absolute;
            top: 170px;
            left: 900px;
        }

        .auto-style6 {
            display: block;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.428571429;
            color: #555555;
            vertical-align: middle;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }

        .auto-style7 {
            position: relative;
            min-height: 1px;
            width: 100%;
            left: 49px;
            top: 358px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style9 {
            width: 383px;
            height: 38px;
            position: absolute;
            top: 332px;
            left: 366px;
            z-index: 1;
        }
    </style>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div>
            <asp:UpdatePanel runat="server" ID="u1">
                <ContentTemplate>
                    <asp:HiddenField ID="hid" runat="server" />
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label1" runat="server" Text="Student Name"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtName" runat="server" CssClass="auto-style6" Width="218px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label2" runat="server" Text="Student Address"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtAddr" runat="server" CssClass="auto-style6" Width="218px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label3" runat="server" Text="Gender:"></asp:Label>
                            </td>
                            <td class="auto-style5">

                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="M">Male</asp:ListItem>
                                    <asp:ListItem Value="F">Female</asp:ListItem>

                                </asp:RadioButtonList>

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label4" runat="server" Text="Phone Number"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtPh" runat="server" TextMode="Number" CssClass="auto-style6" Width="222px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style3">
                                <asp:Label ID="Label5" runat="server" Text="Date Of Enroll"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtDate" runat="server" ReadOnly="true" CssClass="auto-style6" Width="224px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:LinkButton runat="server" CssClass="btn btn-default" OnClick="Unnamed_Click">
                                    <span><i class="glyphicon glyphicon-calendar"></i></span>
                                </asp:LinkButton>
                            </td>


                        </tr>
                        
                    </table>
                     <asp:Calendar Visible="false" OnSelectionChanged="Calendar1_SelectionChanged" CssClass="cal" ID="Calendar1" runat="server"></asp:Calendar>
                         
                    
                </ContentTemplate>
            </asp:UpdatePanel>
            <table class="auto-style9" style="z-index: 1">
                        <tr>
                             <td>
                                <asp:Button CssClass="btn btn-success" ID="btnInsrt" Text="Submit" runat="server" OnClick="btnInsrt_Click" />
                            </td>
                            <td >
                                <asp:Button CssClass="btn btn-warning" Visible="false" ID="BtnUpdate" Text="Update" runat="server" OnClick="BtnUpdate_Click" />
                            </td>
                            <td>
                                <asp:Button CssClass="btn btn-danger" Visible="false" ID="BtnDlete" Text="Delete" runat="server" OnClick="BtnDlete_Click" />
                            </td>
                        </tr>
                    </table>
        </div>
        <br />
        <div>
            <asp:Label runat="server" ID="lblMsg" ForeColor="Green"></asp:Label>

        </div>
        <div class="auto-style7">
            <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" BackColor="White" Width="100%" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Student_id" HeaderText="Student ID" />
                    <asp:BoundField DataField="Student_Name" HeaderText="Student Name" />
                    <asp:BoundField DataField="Student_address" HeaderText="Address" />
                    <asp:BoundField DataField="Student_Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="Student_ph" HeaderText="Phone Number" />
                    <asp:BoundField DataField="DateofEnroll" HeaderText="Date Of Enroll" />
                    <asp:ButtonField HeaderText="Action" Text="View" ControlStyle-CssClass="btn-sm btn-info" />

                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle ForeColor="#4A3C8C" BackColor="#E7E7FF" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />

            </asp:GridView>
        </div>

    </form>
</body>
</html>
