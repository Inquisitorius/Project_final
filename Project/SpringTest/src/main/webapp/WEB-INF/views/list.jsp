<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>List View</title>
</head>
<body>

<div>
    <h1>DB 연동 확인</h1>

    <table border="1">
        <thead>
        <tr>
            <th>userCode</th>
            <th>userName</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="row" items="${allList}">
            <tr>
                <td><c:out value="${row.userCode}"/></td>
                <td><c:out value="${row.userName}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>
