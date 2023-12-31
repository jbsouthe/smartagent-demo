package com.cisco.josouthe;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EchoServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse
            response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>The Date Service</title></head>");
        DateFormat dateFormat;
        try {
            dateFormat = new SimpleDateFormat(request.getParameter("format"));
        } catch (Exception e) {
            dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:MM:ss");
        }
        String date = dateFormat.format(new Date());
        out.println("<body><p>Hi, it's " + date + "</p>");
        out.println(getServletContext().getServerInfo() + "</body></html>");
        out.close();
    }
}
