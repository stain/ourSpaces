<%--
listcell.dsp

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Tue Aug  9 09:47:39     2005, Created by tomyeh
}}IS_NOTE

Copyright (C) 2005 Potix Corporation. All Rights Reserved.

{{IS_RIGHT
	This program is distributed under GPL Version 2.0 in the hope that
	it will be useful, but WITHOUT ANY WARRANTY.
}}IS_RIGHT
--%><%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/zk/core" prefix="z" %>
<c:set var="self" value="${requestScope.arg.self}"/>
<td z.type="Lic" id="${self.uuid}"${self.outerAttrs}${self.innerAttrs}><div id="${self.uuid}!cave"${self.labelAttrs} class="${self.zclass}-cnt <c:if test="${self.listbox.fixedLayout}">z-overflow-hidden</c:if>">${self.columnHtmlPrefix}${self.imgTag}<c:out value="${self.label}" maxlength="${self.maxlength}"/><c:forEach var="child" items="${self.children}">${z:redraw(child, null)}</c:forEach>${self.columnHtmlPostfix}</div></td>
