<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Config_SiteOption, App_Web_gsi5yeuj" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <title>网站参数配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#Tabs0" data-toggle="tab">全局设置</a></li>
        <li><a href="#Tabs1" data-toggle="tab">风格参数</a></li>
        <li><a href="#Tabs2" data-toggle="tab">安全设置</a></li>
        <li><a href="#Tabs3" data-toggle="tab">上传控制</a></li>
        <li><a href="#Tabs4" data-toggle="tab">商城配置</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="Tabs0">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr runat="server" id="Tr4">
                        <td style="width: 200px"><strong><%:lang.LF("全局（站）语言") %>：</strong></td>
                        <td>
                            <asp:RadioButtonList ID="TraditionalChinese" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="false" Selected="True">简体中文</asp:ListItem>
                                <asp:ListItem Value="true">繁体中文</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr runat="server" id="Tr5">
                        <td style="width: 200px"><strong><%:lang.LF("选择语言") %>：</strong></td>
                        <td>
                            <asp:DropDownList ID="languages" CssClass="form-control" Width="200" runat="server" OnSelectedIndexChanged="languages_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Text="中国 - 简体中文" Value="ZH-CN"></asp:ListItem>
                                <asp:ListItem Text="United States - English" Value="EN-US"></asp:ListItem>
                                <asp:ListItem Text="France - Français" Value="FRA"></asp:ListItem>
                                <asp:ListItem Text="Россия - Русский" Value="RUS"></asp:ListItem>
                                <asp:ListItem Text="Deutschland" Value="DEU"></asp:ListItem>
                                <asp:ListItem Text="Italia - Italiano" Value="ITA"></asp:ListItem>
                                <asp:ListItem Text="日本 - 日本語" Value="JPN"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label runat="server" ID="Prompt" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("设备自适配") %>：</strong></td>
                        <td>
                              <input type="checkbox" runat="server" id="UAgent" class="switchChk" />
                            <div style="float: left; padding-top: 3px;"><span id="uaMag" runat="server">[<a href="../AddOn/UAgent.aspx" style="color: blue;">设置</a>]</span></div>
                        </td>
                    </tr>
                    <tr runat="server" id="Tr1">
                        <td style="width: 200px"><strong><%:lang.LF("视频服务器地址") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="Videourl" Width="360px" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                            &nbsp;例如：rtmp://192.168.1.1 </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;">
                            <strong><%:lang.LF("启用系统帮助") %>：</strong>
                        </td>
                        <td>
                            <input type="checkbox" runat="server" id="IsOpenHelp" class="switchChk" onchange="$('#IsOpenHelp_Btn').click();" />
                            <asp:Button runat="server" ID="IsOpenHelp_Btn" style="display:none;" OnClick="IsOpenHelp_SelectedIndexChanged" />
                                <asp:CheckBox ID="DeleteLocal" Style="color: Red;" runat="server" />
                                <span id="PromptHelp" runat="server">(<a id="PromptHelps" runat="server" href="http://update.zoomla.cn/help.rar" style="color: Blue;" target="_blank">下载离线帮助包</a>)</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("开启日志") %>：</strong></td>
                        <td>
                              <input type="checkbox" runat="server" id="OpenLog" class="switchChk" checked="checked" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("保留日志数量") %>：(<%:lang.LF("0-不限制") %>)</strong></td>
                        <td>
                            <asp:TextBox ID="Savanumlog" runat="server" Width="360" CssClass="form-control pull-left"></asp:TextBox>
                            &nbsp;条 </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("保留日志天数") %>：(<%:lang.LF("0-不限制") %>)</strong></td>
                        <td>
                            <asp:TextBox ID="Savadaylog" Width="360" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                            &nbsp;天 
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("评论积分赠送") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="CommentRule" Width="360" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                            &nbsp;分 
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("生成PDF目录") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="txtPdf" runat="server" Width="360" CssClass="form-control pull-left"></asp:TextBox>
                            &nbsp;目录名前后不要加斜杠"/" 
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("广告存储目录") %>：</strong><br />
                        </td>
                        <td>
                            <asp:TextBox ID="txtAdvertisementDir" Width="360" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                            <span style="color: #1e860b;">&nbsp;为防止广告拦截软件影响广告展示，您可以 修改广告JS存放目录(默认为AD)。</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("站长拥有资金") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="MastMoney" runat="server" Width="360" CssClass="form-control pull-left"></asp:TextBox></td>
                    </tr>
                    <tr runat="server" id="Tr3" visible="false" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 200px"><strong><%:lang.LF("黄页注册免费二级域名") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="freedomain" Width="360px" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                            <span style="color: #1e860b;">&nbsp;请不要输入 http:// 和 www</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("链接地址方式") %>：</strong></td>
                        <td style="padding-left: 8px;">
                            <asp:RadioButton ID="rdoIapTrue" runat="server" GroupName="IsAbsoluatePath" TabIndex="1" Text="相对路径" />
                            <asp:RadioButton ID="rdoIapFalse" runat="server" GroupName="IsAbsoluatePath" TabIndex="2" Text="绝对路径" /></td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("短消息提示") %>：</strong></td>
                        <td style="padding-left: 8px;">
                             <input type="checkbox" runat="server" id="SMSTips" class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("生成首页扩展名") %>：</strong></td>
                        <td>
                            <asp:RadioButtonList ID="IndexEx" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0">.html</asp:ListItem>
                                <asp:ListItem Value="1">.htm</asp:ListItem>
                                <asp:ListItem Value="2">.shtml</asp:ListItem>
                                <asp:ListItem Value="3">.aspx(不生成静态)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("生成静态目录") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="txtCatalog" runat="server" Width="360" CssClass="form-control pull-left"></asp:TextBox>
                            目录名前后不要加斜杠"/" </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs1">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("是否开启个人空间") %>：</strong></td>
                        <td style="padding-left: 8px;">
                            <input type="checkbox" runat="server" id="IsZone"  class="switchChk"  /></td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("云盘共享空间权限") %>：</strong></td>
                        <td style="padding-left: 8px;">
                            <asp:CheckBoxList runat="server" ID="cloud_ChkList" RepeatDirection="Horizontal">
                                <asp:ListItem Value="read">可读</asp:ListItem>
                                <asp:ListItem Value="del">可删除</asp:ListItem>
                                <asp:ListItem Value="up">可上传</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("是否开启多用户网店功能") %>：</strong></td>
                        <td style="padding-left: 8px;">
                             <input type="checkbox" runat="server" id="IsMall"  class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("后台初始模式界面") %>：</strong></td>
                        <td>
                            <asp:RadioButtonList ID="rblManage" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="3">响应式模式</asp:ListItem>
                                <asp:ListItem Value="2">站群模式</asp:ListItem>
                                <asp:ListItem Selected="True" Value="1">传统模式</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong>是否关闭传统后台：</strong></td>
                        <td>
                             <input type="checkbox" runat="server" id="TraditionRB" class="switchChk" checked="checked" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("开启云台提示") %>：</strong></td>
                        <td style="padding-left: 8px;">
                             <input type="checkbox" runat="server" id="cloudLeadTips" class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("系统云台") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="txtProjectServer" Width="200" runat="server" CssClass="form-control"></asp:TextBox>
                            <span class="rspan">提示：支持从远程云端下载功能与模板界面，官方服务器地址：http://updata.zoomla.cn</span></td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("网站首页模板") %>：</strong></td>
                        <td>
                          <%--  <asp:TextBox ID="TxtIndexTemplate" Width="200" runat="server" CssClass="form-control pull-left"></asp:TextBox>--%>
                            <asp:DropDownList runat="server" ID="IndexTemplate_DP" Width="200" CssClass="form-control pull-left" DataTextField="rname" DataValueField="rname" EnableViewState="false" ></asp:DropDownList>
                            <input type="button" style="margin-left: 5px;" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TxtIndexTemplate') + '&FilesDir=', 650, 480)" class="btn btn-primary" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("店铺首页模板") %>：</strong></td>
                        <td>
                            <asp:DropDownList runat="server" ID="ShopTemplate_DP" Width="200" CssClass="form-control pull-left" DataTextField="rname" DataValueField="rname" EnableViewState="false" ></asp:DropDownList>
                            <input type="button" style="margin-left: 5px;" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('txtShopTemplate') + '&FilesDir=', 650, 480)" class="btn btn-primary" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("模板方案") %>：</strong></td>
                        <td>
                            <div id="DivtemplateDir">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
                                <asp:DropDownList ID="DropTemplateDir" runat="server" onchange="cc()" Width="200" CssClass="form-control pull-left" style="display:inline;"></asp:DropDownList>
                                
                                <asp:Button ID="Button2" Style="margin-left: 5px;" OnClick="Button2_Click" OnClientClick="document.getElementById('lblKai').innerText='开销中...';" runat="server" Text="一键开销" CssClass="btn btn-primary" UseSubmitBehavior="false" />
                                <asp:Label ID="lblKai" runat="server" Style="color: Red;" Text="*提示：更改方案后需要一键开销，且会对原数据进行不可恢复性的擦除。"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("风格路径") %>：</strong></td>
                        <td>
                            <div id="DivCssDir">
                                <asp:TextBox ID="txtCssDir" runat="server" Width="200" CssClass="form-control pull-left" style="display:inline;"></asp:TextBox>
                                <span style="color: Red; margin-left: 5px;">*提示：为保证风格能够与云台结合使用，请继承上一项的模板目录</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("默认风格") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="txtStylePath" Width="200" runat="server" CssClass="form-control pull-left"></asp:TextBox></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs2">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("后台管理认证码") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="txtSiteManageCode" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
<%--                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("安全域名") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="safeDomainT" runat="server" CssClass="form-control"/><span>提示:例如写入baidu.com,则只有用*.baidu.com域名才能打开该页面</span></td>
                    </tr>--%>
                    <tr>
                        <td><strong><%:lang.LF("是否启用后台管理认证码") %>：</strong></td>
                        <td style="padding-left: 6px;">
                             <input type="checkbox" runat="server" id="EnableSiteManageCod" class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("是否使用软键盘输入密码") %>：</strong></td>
                        <td style="padding-left: 6px;">
                             <input type="checkbox" runat="server" id="EnableSoftKey" class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <td><strong><%:lang.LF("是否启用发送短信") %>：</strong></td>
                        <td style="padding-left: 6px;">
                            <input type="checkbox" runat="server" id="OpenSendMessage" class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <td><strong><%:lang.LF("黄页是否需要审核") %>：</strong></td>
                        <td>
                            <input type="checkbox" runat="server" id="rdoBtnLSh" class="switchChk" checked="checked" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("有问必答是否支持匿名提交") %>：</strong></td>
                        <td>
                            <input type="checkbox" runat="server" id="MailPermission" class="switchChk" checked="checked" />
                        </td>
                    </tr>
                    <tr>
                        <td><strong><%:lang.LF("站群采集密码") %>：</strong></td>
                        <td>
                            <asp:TextBox runat="server" ID="SiteCollKey_T" CssClass="form-control" />
                            <span class="rspan">提示：为空则不允许被采集,如你需要采集其他逐浪子站<a href="#">[点此配置]</a></span>
                        </td>
                    </tr>
                    <tr runat="server" id="Tr2">
                        <td style="width: 200px"><strong><%:lang.LF("Flex Api(试戴密匙)") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="FlexKey" Width="360px" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("留言本是否需要登陆") %>：</strong></td>
                        <td>
                            <input type="checkbox" runat="server" id="OpenMessage" class="switchChk" checked="checked" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("留言显示是否需要审核") %>：</strong></td>
                        <td>
                            <input type="checkbox" runat="server" id="OpenAudit" class="switchChk" checked="checked" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 300px"><strong><%:lang.LF("是否过滤敏感词汇") %>：</strong></td>
                        <td>
                            <input type="checkbox" runat="server" id="rdoIsSensitivity" class="switchChk" checked="checked" />
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td style="width: 300px"><strong><%:lang.LF("过滤敏感词汇") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtSensitivity" runat="server" Rows="6" TextMode="MultiLine" Width="300px" CssClass="x_input"></asp:TextBox>
                            &nbsp;提示：敏感词汇请用","分隔 </td>
                    </tr>
                    <asp:HiddenField ID="HiddenUrlWrite" runat="server" />
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs3">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("默认编辑器") %>：</strong></td>
                        <td>
                            <asp:RadioButtonList ID="EditVer" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="3">百度Ueditor</asp:ListItem>
                                <asp:ListItem Value="1">Ckeditor</asp:ListItem>
                                <asp:ListItem Value="2">KindEditor(支持完美word生成)</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <%--  <tr>
                    <td style="width: 200px"><strong>编辑器是否保存远程图片：</strong></td>
                    <td style="padding-left:8px;">
                        <asp:RadioButton ID="IsSaveRemoteImageFalse" runat="server" GroupName="IsSaveRemoteImage" TabIndex="2" Text="不启用" />
                        <asp:RadioButton ID="IsSaveRemoteImageTrue" runat="server" GroupName="IsSaveRemoteImage" TabIndex="1" Text="启用" />  *仅针对Ckeditor
                    </td>
                    </tr>--%>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("媒体文件最大值") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtUpMediaSize" Width="200" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                            &nbsp;KB
                      提示：1 KB = 1024 Byte，1 MB = 1024 KB
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("Flash等媒体文件大小") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtUpFlashSize" Width="200" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                            &nbsp;KB
                      提示：1 KB = 1024 Byte，1 MB = 1024 KB </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("网站上传目录") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="txtUploadDir" Width="200" runat="server" CssClass="form-control pull-left"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("文件保存路径") %>：</strong></td>
                        <td>
                            <select id="FileRJ" class="form-control" runat="server" style="width: 200px;">
                                <option value="0">节点/文件类型</option>
                                <option value="1">文件类型/年月</option>
                                <option value="2">文件类型/年/月</option>
                                <option value="3">文件类型/节点/年/月</option>
                                <option value="4">节点/年/月</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("文件命名规则") %>：</strong></td>
                        <td>
                            <select id="FileN" runat="server" style="width: 200px" class="form-control">
                                <option value="0">随机数</option>
                                <option value="1">年月日时分秒</option>
                                <option value="2">时分秒</option>
                                <option value="3">原文件名</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("附件类型限制") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="txtUploadFileExts" Width="300" runat="server" CssClass=" form-control" TextMode="MultiLine" Rows="3" Columns="60" /></td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("可上传附件最大值") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="txtUploadFileMaxSize" Width="300" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                            &nbsp;KB
                      提示：1 KB = 1024 Byte，1 MB = 1024 KB </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("编辑器上传图片类型限制") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtUpPicExt" runat="server" Width="300" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="60" /></td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("可上传图片最大值") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtUpPicSize" runat="server" Width="300" CssClass="form-control pull-left"></asp:TextBox>
                            &nbsp;KB
                      提示：1 KB = 1024 Byte，1 MB = 1024 KB </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("媒体文件类型限制") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtUpMediaExt" runat="server" Width="300" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="60" /></td>
                    </tr>
                    <tr>
                        <td style="width: 200px"><strong><%:lang.LF("是否允许上传文件") %>：</strong></td>
                        <td style="padding-left: 8px;">
                            <input type="checkbox" runat="server" id="EnableUploadFiles" class="switchChk" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs4">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr>
                        <td style="width: 200px;"><strong><%:lang.LF("订单结算最低限制") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="txtSetPrice" runat="server" Width="200" CssClass="form-control"></asp:TextBox>
                            <span class="rspan">提示：为 0 则不做限制</span>
                       </td>
                    </tr>
                    <tr>
                        <td><strong><%:lang.LF("快递实时跟踪API") %>：</strong></td>
                        <td>
                            <input type="checkbox" runat="server" id="RB_switch" class="switchChk" onchange="$('#Api').toggle();" />
                            <span id="Api" runat="server" style="display: none;">
                                <asp:TextBox ID="TB_Api" runat="server" CssClass="form-control"></asp:TextBox>&nbsp;
                                <span class="rspan">提示：用于商城网店查询订单，<a href="http://www.kuaidi100.com/openapi/" target="_blank" style="color: #f00; text-decoration: underline;">点此申请快递100集成密钥</a>。</span>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td><strong><%:lang.LF("免邮方式") %>：</strong></td>
                        <td>
                            <asp:TextBox ID="TB_pronum" runat="server" CssClass="form-control" Width="50"></asp:TextBox><span>件 提示：购买商品超出此数量免邮(0为不免邮)</span></td></tr>
                    <tr><td><strong>订单短信提醒：</strong></td><td><input type="checkbox" runat="server" id="OrderMsg_Chk" class="switchChk"></td></tr>
                    <tr runat="server" id="OrderMsg_Tr"><td><strong>短信模板：</strong></td><td><asp:TextBox runat="server" ID="OrderMsg_T" TextMode="MultiLine" CssClass="form-control textbox_mid" Height="120" /></td></tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="text-center" style="margin-bottom: 60px;">
        <asp:Button ID="Button1" runat="server" Text="保存设置" OnClick="Button1_Click" CssClass="btn btn-primary" OnClientClick="setTimeout(function () { document.getElementById('Button1').disabled = true;},50)" />
        <asp:Button ID="btnReset" runat="server" CssClass="btn btn-primary" Text="重置" OnClientClick="return confirm('重置后所有信息都需重新设置,确定要重置吗?')" OnClick="btnReset_Click" />
        <asp:HiddenField runat="server" ID="thisDiv" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <style type="text/css">
          .rspan{color:green;margin-left:5px;}
    </style>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        function DisApi()
        {
            $("#Api").toggle();
        }
        var tab = '<%= Request.QueryString["tad"]%>';
        $().ready(function () {
            $("li a[href='#Tabs" + tab + "']").parent().addClass("active").siblings("li").removeClass("active");
            $("#Tabs" + tab).addClass("active").siblings("div").removeClass("active");
        })
        var obj1 = document.getElementById("DropTemplateDir");
        var obj2 = document.getElementById("txtCssDir");
        function cc() {
            obj2.value = obj1.value + "/style";
        };
        function WinOpenDialog(url, w, h) {
            open(url, window, 'Width=' + w + ',Height=' + h + ',center=yes,status=no,help=no');
        }
        function showconfig(n) {
            $(".nav-tabs").find("li").removeClass("active");
            $(".nav-tabs").find("li a[href=#Tabs" + n + "]").parent().addClass("active");
            $(".tab-content").find(".tab-pane").removeClass("active");
            $(".tab-content").find("#Tabs" + n).addClass("active");
        }
    </script>
</asp:Content>
