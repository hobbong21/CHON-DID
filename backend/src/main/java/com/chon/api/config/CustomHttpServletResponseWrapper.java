package com.chon.api.config;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.WriteListener;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

public class CustomHttpServletResponseWrapper extends HttpServletResponseWrapper {
    private PrintWriter writer;
    private final ByteArrayOutputStream copy;
    private final ServletOutputStream outputStream;

    public CustomHttpServletResponseWrapper(HttpServletResponse response) throws IOException {
        super(response);
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        this.copy = new ByteArrayOutputStream();
        this.outputStream = new ServletOutputStream() {
            @Override
            public void write(int b) throws IOException {
                copy.write(b); // Ghi vào ByteArrayOutputStream sao chép
                getResponse().getOutputStream().write(b); // Ghi vào OutputStream thực sự của response
            }

            @Override
            public boolean isReady() {
                return true;
            }

            @Override
            public void setWriteListener(WriteListener writeListener) {
            }
        };
    }

    @Override
    public ServletOutputStream getOutputStream() throws IOException {
        if (this.writer != null) {
            throw new IllegalStateException("getWriter() has already been called on this response.");
        }
        return outputStream;
    }

    @Override
    public PrintWriter getWriter() throws IOException {
        if (this.outputStream != null) {
            throw new IllegalStateException("getOutputStream() has already been called on this response.");
        }

        // Sử dụng OutputStreamWriter để ghi vào ByteArrayOutputStream
        this.writer = new PrintWriter(new OutputStreamWriter(copy, this.getResponse().getCharacterEncoding()), true);
        return writer;
    }

    @Override
    public void flushBuffer() throws IOException {
        super.flushBuffer();
        if (this.writer != null) {
            this.writer.flush();
        } else if (this.outputStream != null) {
            this.outputStream.flush();
        }
    }

    public byte[] getContentAsByteArray() {
        return this.copy.toByteArray();
    }

    public Map<String, String> getAllHeaders() {
        Map<String, String> headers = new HashMap<>();
        this.getHeaderNames().forEach((it) -> {
            headers.put(it, this.getHeader(it));
        });
        return headers;
    }
}
