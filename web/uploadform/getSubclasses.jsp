<%@ page language="java" import="com.hp.hpl.jena.ontology.*,java.util.Iterator,java.util.*,java.net.*,java.text.SimpleDateFormat,java.util.ArrayList,java.io.*,java.net.*,java.util.Vector,common.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="ontology" class="common.OntologyHandler" />
<% 
ParameterHelper parHelp = new ParameterHelper(request, session);

	String liClass = (String)parHelp.getParameter("liClass",  "");
	String liStyle = (String)parHelp.getParameter("liStyle",  "");
	String ulClass = (String)parHelp.getParameter("ulClass",  "");
	String ulStyle = (String)parHelp.getParameter("ulStyle",  "");
	String ulId = (String)parHelp.getParameter("ulId",  "");
	String onClick = (String)parHelp.getParameter("onClick",  "");
	String innerUlStyle = (String)parHelp.getParameter("innerUlStyle",  "padding-left:15px");
	
	String className = (String)parHelp.getParameter("className",  "http://openprovenance.org/ontology#Process");
	
	Vector<String> subClasses = ontology.getSubclassListNamespace("all",  className);
%>
<%!	//Function for recursive loading the ontology tree.
    // There is a lot of parameters, but unfortunatelly, the method doesn't see the jsp variables.
 public String loadTree(String content, String className, common.OntologyHandler ontology, 
		 String liClass, String liStyle, String onClick, String ulClass, String ulStyle, String innerUlStyle){
	Vector<String> subClasses = ontology.getSubclassListNamespace("all", className);
	className=Utility.getLocalName(className);
	//Name of class
	/*if(subClasses.size() == 0){
		content += "<li style=\""+liStyle+"\" class=\""+liClass+"\" rel=\"resource\"><span style=\"float:left; margin-right:5px;\" class=\"ui-icon ui-icon-info\"></span><a href=\"#\" style=\"float:left;\" >" + className+"</a>";
	}
	else{ // start a new ul at the end of string.
		content += "<li style=\""+liStyle+"\" class=\""+liClass+" expandable\" rel=\"resource\"><span style=\"float:left; margin-right:5px;\" class=\"ui-icon ui-icon-info\"></span><a href=\"#\" style=\"float:left;\" >" + className + "</a><ul  style=\""+ulStyle+"\" class=\""+ulClass+"\">";		
	}*/
	content += "<li style=\""+liStyle+"\" class=\""+liClass+"\" rel=\"resource\"><span style=\"float:left; margin-right:5px;\" class=\"ui-icon ui-icon-info\"></span><a href=\"#\" onClick=\""+onClick.replaceAll("#className", className)+"\"style=\"float:left;\" >" + className+"</a><br/></li>";
	
	if(subClasses.size() > 0){
		content += "<li><ul style=\""+innerUlStyle+"\">";
		//Adding all children
		for(String subClass : subClasses){
			content += loadTree("", subClass, ontology, liClass, liStyle, onClick, ulClass, ulStyle, innerUlStyle);
		}
		// closing ul and li
		content += "</ul></li>";
	}
	
	return content;
}
%>
		<ul id="<%=ulId%>" class="<%=ulClass%>" >
			<%
				for(String subClass : subClasses){
					String content = loadTree("", subClass, ontology, liClass, liStyle, onClick, ulClass, ulStyle, innerUlStyle);%>
					<%=content %>
			<%	} %>
		</ul>	
					