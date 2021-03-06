<%@ page language="java" import="provenanceService.*,com.hp.hpl.jena.rdf.model.*, com.hp.hpl.jena.ontology.*,java.util.Iterator,java.util.*,java.net.*,java.text.SimpleDateFormat,java.util.ArrayList,java.io.*,java.net.*,java.util.Vector" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 

	ParameterHelper parHelp = new ParameterHelper(request, session);

	ProvenanceServiceImpl ps = (ProvenanceServiceImpl)session.getAttribute("simulationProv");
	String sessionId = (String)parHelp.getParameter("sessionId",  "");	
	String entityId = (String)parHelp.getParameter("entity",  "");	
	Graph g = ps.getProvenance(entityId, sessionId);	
	for(int i=0;i<g.size();i++){
		Node n = g.get(i);
		if(n.getTitle() == null)
			n.setTitle(Utility.getLocalName(n.getId()));

		//if(!"Agent".equals(n.getBasicType()))
		//	n.setTitle(ProvenanceService.getResourceTitle(n.getId()));
	}
	String json = ProvenanceService.graphToJSONString(g);
%>
<%=json %>