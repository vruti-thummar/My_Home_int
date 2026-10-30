<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="myhome.admin.report" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Report Page</h1>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Report" OnClick="Button1_Click" />
            <br />
            <br />
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
        </div>
    </form>
</body>
</html>
