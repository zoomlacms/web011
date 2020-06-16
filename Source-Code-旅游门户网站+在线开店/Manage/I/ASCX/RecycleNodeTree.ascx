<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_RecycleNodeTree, App_Web_rsvfdmb3" clientidmode="Static" %>
   
<div class="menu_tit"><span class="glyphicon glyphicon-globe"></span>内容管理</div>
 <div id="nodeNav" style="padding:0 0 0 0;">
        <div class="input-group">
            <input type="text" ID="keyWord" class="form-control ascx_key" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"I/Content/ContentRecycle.aspx?keyWord=" %>',this);" placeholder="搜索内容" />
            <span class="input-group-btn">
                <button class="btn btn-default" type="button" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"I/Content/ContentRecycle.aspx?keyWord=" %>','keyWord');"><span class="glyphicon glyphicon-search"></span></button>
            </span>
        </div>
        <div>
            <div class="tvNavDiv">
                <div class="left_ul">
                    <asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
                </div>
            </div>
            <span style="color: green;" runat="server" id="remind" visible="false" />
        </div>
    </div>
<style type="text/css">
    .tvNavDiv{float:left;background-color:#f3f3f3;height:100%;width:100%;margin-top:1px;}
    .tvNav_ul li{padding-left:20px;}
    .left_ul ul li {border-bottom:1px solid #ddd;}
    .left_ul ul li a{color:#1963aa;font-size:0.9em;display:block;text-decoration:none;height:35px;line-height:35px;padding-left:10px;}
    .left_ul ul li a:hover{ background:#6BBEF6; color:#fff;}
    .activeLi{ background:#6BBEF6; color:#fff;border-bottom:1px solid #ddd;}
    .list_span {margin-right:10px;}/*End*/
</style>