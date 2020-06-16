<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_SpecialTree, App_Web_rsvfdmb3" %>
 <div class="menu_tit"><span class="glyphicon glyphicon-globe"></span>专题内容管理</div>
<div id="nodeNav" style="padding:0 0 0 0;">

    <div>
        <div class="tvNavDiv">
            <div class="left_ul">
                <asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
            </div>
        </div>
        <span style="color: green;" runat="server" id="remind" visible="false" />
    </div>
</div>
