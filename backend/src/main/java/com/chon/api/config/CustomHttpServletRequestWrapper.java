package com.chon.api.config;

import jakarta.servlet.ReadListener;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletInputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.Part;
import org.springframework.util.StreamUtils;

import java.io.*;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;

public class CustomHttpServletRequestWrapper extends HttpServletRequestWrapper {

    private final String headerToRemove;
    private  byte[] body = new byte[0];

    public CustomHttpServletRequestWrapper(HttpServletRequest request, String headerToRemove) throws IOException {
        super(request);
        this.headerToRemove = headerToRemove;
        if (request.getContentType() != null && !request.getContentType().startsWith("multipart/form-data")) {
            InputStream requestInputStream = request.getInputStream();
            try {
                this.body = StreamUtils.copyToByteArray(requestInputStream);
            }catch (IOException e){
                this.body = new byte[0];
            }
        }
    }

    @Override
    public String getHeader(String name) {
        if (headerToRemove!= null && headerToRemove.equalsIgnoreCase(name)) {
            return null;  // Remove the header by returning null
        }
        return super.getHeader(name);
    }

    @Override
    public Enumeration<String> getHeaders(String name) {
        if (headerToRemove!=null  && headerToRemove.equalsIgnoreCase(name)) {
            return Collections.emptyEnumeration();  // Remove the header
        }
        return super.getHeaders(name);
    }

    @Override
    public Collection<Part> getParts() throws IOException, ServletException {
        return super.getParts();
    }


    @Override
    public ServletInputStream getInputStream() throws IOException {
        final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(this.body);
        return new ServletInputStream() {
            @Override
            public boolean isFinished() {
                return false;
            }

            @Override
            public boolean isReady() {
                return false;
            }

            @Override
            public void setReadListener(ReadListener readListener) {

            }

            @Override
            public int read() throws IOException {
                return byteArrayInputStream.read();
            }
        };
    }

    @Override
    public BufferedReader getReader() {
        // Create a reader from cachedContent
        // and return it
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(this.body);
        return new BufferedReader(new InputStreamReader(byteArrayInputStream));
    }
}