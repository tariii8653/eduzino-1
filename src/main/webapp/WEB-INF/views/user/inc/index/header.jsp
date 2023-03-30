<%@page import="com.edu.zino.domain.TopCategory"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%List<TopCategory> topCategorieList = (List)request.getAttribute("topCategoryList");%>
        <header class="site-header">
            <div class="nav-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-9 col-lg-3">
                            <div class="site-branding">
                                <h1 class="site-title"><a href="/" rel="home">Edu<span>zino</span></a></h1>
                            </div><!-- .site-branding -->
                        </div><!-- .col -->

                        <div class="col-3 col-lg-9 flex justify-content-end align-content-center">
                        <nav class="site-navigation flex justify-content-end align-items-center">
                            <ul class="flex flex-column flex-lg-row justify-content-lg-end align-content-center">
                            	<%for(TopCategory topCategory:topCategorieList){ %>
	                                <li><a href="/subject/category/<%=topCategory.getTop_category_idx()%>"><%=topCategory.getTop_name()%></a></li>
                                <%} %>
                            </ul>

                            <div class="hamburger-menu d-lg-none">
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </div><!-- .hamburger-menu -->
							

                            <div class="header-bar-cart">
                                <a href="member/loginform" class="flex justify-content-center align-items-center"><span aria-hidden="true" class="mdi mdi-lock-outline"></span></a>
                            </div><!-- .header-bar-search -->
                        </nav><!-- .site-navigation -->
                    </div><!-- .col -->
                    </div><!-- .row -->
                </div><!-- .container -->
            </div><!-- .nav-bar -->
        </header><!-- .site-header -->
