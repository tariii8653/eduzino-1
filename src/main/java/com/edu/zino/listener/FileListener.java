package com.edu.zino.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class FileListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application = sce.getServletContext();
		String imgUri = "/resources/teacher/subject/img";
		String path = application.getRealPath(imgUri);
		application.setAttribute("imgUri", imgUri);
		application.setAttribute("filePath", path);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
