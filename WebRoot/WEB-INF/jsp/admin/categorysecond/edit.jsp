<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
	</HEAD>
	
	<body>
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/admin/adminCategorySecond_update.action" method="post">
			<input type="hidden" name="csid" value="${findByCsid.csid }">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>编辑二级分类</STRONG>
						</strong>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						二级分类名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="text" name="csname" value="${existCategorySecond.csname }" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<!--colSpan="表示一个表哥横跨几个单元格 -->
					<td align="center" colSpan="4"> 
						<input type="submit" value="确定"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset">重置</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!--history.go(-1)返回上一个页面  -->
						<input type="button" onclick="history.go(-1)" value="返回"/>
					</td>
				</tr>			</table>
		</form>
	</body>
</HTML>