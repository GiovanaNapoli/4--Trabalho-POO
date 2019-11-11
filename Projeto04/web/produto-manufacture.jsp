<%-- 
    Document   : produto-manufacture
    Created on : 08/11/2019, 00:08:46
    Author     : giova
--%>

<%@page import="br.fatecpg.db.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/main.css">
        <title>Ver Produto</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <%if (request.getParameter("i") == null) {%>
            <div>Indicie não encontrado</div>
        <%} else {%>
            <%try {%>
            <%int i = Integer.parseInt(request.getParameter("i"));%>
            <br>
            <br>
            <br>
            <table>
                <tr>
                    <th>ID_FABRICA</th>
                    <th>ID_PRODUTO</th>
                    <th>CODIGO</th>
                    <th>PREÇO</th>
                    <th>STATUS</th>
                    <th>DESCRIÇÃO</th>
                </tr>
                <%for (Product pr : Product.getList()) {%>
                    <tr>
                        <td><%=i%></td>
                        <td><%=pr.getId()%></td>
                        <td><%=pr.getCodigo()%></td>
                        <td><%=pr.getPreco()%></td>
                        <td><%=pr.getStatus()%></td>
                        <td><%=pr.getDescricao()%></td>
                </tr>
                <%}%>
            </table>
            <%} catch (Exception e) {%>
                <tr>
                    <td colspan="3">Erro <%= e.getMessage()%></td>
                </tr>
            <%}%>
        <%}%>
    </body>
</html>
