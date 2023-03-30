<%@page import="com.edu.zino.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	HttpSession httpSession = request.getSession();
	Member member = (Member)session.getAttribute("member");
%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
<ul class="nav">
  <li class="nav-item nav-profile border-bottom">
      <a class="nav-link flex-column" href="/teacher/salescaculate/sales">
      <div class="nav-logo-image">
        <img src="/resources/teacher/data/logo2.jpg" alt="logo" />
      </div>
      </a>
    <a href="#" class="nav-link flex-column">
      	<div class="nav-profile-image">
        <img src="/resources/teacher/assets/images/faces/face1.jpg" alt="profile" />
        <!--change to offline or busy as needed-->
        </div>
        <div class="nav-profile-text d-flex ml-0 mb-3 flex-column">
          <span class="font-weight-semibold mb-1 mt-2 text-center"><%= member.getMember_nickname() %></span>
        </div>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/teacher/salescaculate/sales">
        <i class="mdi mdi-chart-bar menu-icon"></i>
        <span class="menu-title">매출 & 정산</span>
      </a>
     <li class="nav-item">
      <a class="nav-link" href="/teacher/subject/list">
        <i class="mdi mdi-youtube menu-icon"></i>
        <span class="menu-title">강의관리</span>
      </a>
    <li class="nav-item">
       <a class="nav-link" data-toggle="collapse" href="#ui-basic3" aria-expanded="true" aria-controls="ui-basic">
        <i class="mdi mdi-clipboard-account menu-icon"></i>
        <span class="menu-title">수강생관리</span>
                 <i class="menu-arrow"></i>
      </a>
      <div class="collapse show" id="ui-basic3">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item">
            <a class="nav-link" href="/teacher/student/studentManagement">수강생관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/teacher/chat/message">메세지</a>
          </li>
        </ul>
      </div>
    </li>
    <li class="nav-item">
       <a class="nav-link" data-toggle="collapse" href="#ui-basic4" aria-expanded="true" aria-controls="ui-basic">
        <i class="mdi mdi-content-paste menu-icon"></i>
        <span class="menu-title">활동</span>
                 <i class="menu-arrow"></i>
      </a>
      <div class="collapse show" id="ui-basic4">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item">
            <a class="nav-link" href="pages/ui-features/buttons.html">운영자공지사항</a>
          </li>
        </ul>
      </div>
    </li>

  </ul>
</nav>
      