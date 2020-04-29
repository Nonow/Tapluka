<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Notifications section-->
<html>
<body>
	<h2>Spring MVC and List Example</h2>

	<c:if test="${not empty lists}">

		<!-- right section-->
                <div class="dh-col m3">
                    <div class="dh-container dh-display-container dh-margin-bottom">
                        <div class="dh-container dh-theme-d2">
                            <h4 class="dh-titre dh-opacity"><b>Notifications</b></h4>
                        </div>
                        <ul class="dh-ul dh-hoverable dh-white">
                            <c:if test="{$not empty lists}">
                            <c:forEach var="notification" items="${lists}">
                                <li class="dh-padding">
                                    <img src="/images/user1.png" alt="Image" class="dh-left dh-margin-right dh-circle"
                                         style="width:50px">
                                    <span class="dh-large">${notification.title}</span><br>
                                    <span>${notification.content}</span>
                                </li>
                            </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>

	</c:if>
</body>
</html>