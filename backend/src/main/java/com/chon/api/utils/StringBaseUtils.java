package com.chon.api.utils;

import com.chon.api.entity.CategoryEntity;

import java.security.SecureRandom;
import java.text.Normalizer;
import java.util.Objects;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringBaseUtils {
    private static final String HEX_CHARACTERS = "0123456789abcdef";
    private static final int TXID_LENGTH = 14;
    private static final Random RANDOM = new SecureRandom();

    public static boolean isNullOrEmpty(String str) {
        return ((str == null) || (str.trim().length() == 0));
    }

    public static String escapeSql(String input) {
        String result = input.trim().replace("/", "//").replace("_", "/_").replace("%", "/%");
        return result;
    }

    public static String sqlStringSearch(String str, boolean isLike) {
        if (isLike)
            return "%" + StringBaseUtils.escapeSql(str.toLowerCase().trim()) + "%";
        else
            return StringBaseUtils.escapeSql(str.toLowerCase().trim());
    }

    public static String extractTextByPattern(String strContent, String regex) {
        try {
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(strContent);
            if (matcher.find()) {
                return matcher.group(1).trim();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static String removeAccentAndSpecialChar(String text) {
        try {
            if (!isNullOrEmpty(text)) {
                String temp = Normalizer.normalize(text, Normalizer.Form.NFD);
                Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
                return pattern.matcher(temp).replaceAll("").replaceAll("Đ", "D").replaceAll("đ", "d").replaceAll("[^\\x00-\\x7F­-]", " ");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static boolean checkContainNumber(String text) {
        boolean result = false;
        if (text == null) {
            return result;
        }
        try {
            char[] chars = text.toCharArray();
            StringBuilder sb = new StringBuilder();
            for (char c : chars) {
                if (Character.isDigit(c)) {
                    sb.append(c);
                }
            }
            if (sb.length() > 0) {
                result = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public static boolean checkContainAlphabetic(String text) {
        boolean result = false;
        try {
            char[] chars = text.toCharArray();
            StringBuilder sb = new StringBuilder();
            for (char c : chars) {
                if (Character.isAlphabetic(c)) {
                    sb.append(c);
                }
            }
            if (sb.length() > 0) {
                result = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public static String formatMoneyInvoice(String data) {
        try {
            if (!isNullOrEmpty(data)) {
                String[] dataArray = data.split("\\.");
                return dataArray != null && dataArray.length > 0 ? dataArray[0] : data;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public static String removeSpecialCharacters(String str) {
        return str.replaceAll("[^a-zA-Z0-9\\s]", "");
    }


    public static int getLevenshteinDistance(String X, String Y) {
        int m = X.length();
        int n = Y.length();

        int[][] T = new int[m + 1][n + 1];
        for (int i = 1; i <= m; i++) {
            T[i][0] = i;
        }
        for (int j = 1; j <= n; j++) {
            T[0][j] = j;
        }

        int cost;
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                cost = X.charAt(i - 1) == Y.charAt(j - 1) ? 0 : 1;
                T[i][j] = Integer.min(Integer.min(T[i - 1][j] + 1, T[i][j - 1] + 1),
                        T[i - 1][j - 1] + cost);
            }
        }

        return T[m][n];
    }

    public static double findSimilarity(String x, String y) {
        if (x == null || y == null) {
            throw new IllegalArgumentException("Strings must not be null");
        }

        double maxLength = Double.max(x.length(), y.length());
        if (maxLength > 0) {
            // optionally ignore case if needed
            return (maxLength - getLevenshteinDistance(x, y)) / maxLength;
        }
        return 1.0;
    }

    public static String formatMoney(String text) {
        String money = text;
        int totalDotChar = CountCharsInString(text, '.');
        if (totalDotChar == 1) {
            int startIndex = money.indexOf(".");
            money = money.substring(0, startIndex);
        }
        money = money.replaceAll("\\.", "");
        money = money.replaceAll("\\,", "");

        return money;
    }

    private static int CountCharsInString(String text, char ch) {
        int totalCharacters = 0;
        for (int i = 0; i < text.length(); i++) {
            if (ch == text.charAt(i)) {
                totalCharacters++;
            }
        }
        return totalCharacters;
    }

    public static boolean firstCharDigit(String text) {
        if (text != null && !text.isEmpty()) {
            char firstChar = text.charAt(0);
            if (Character.isDigit(firstChar)) {
                return true;
            }
        }
        return false;
    }
    public static boolean checkFileValid(String fileName, byte[] file, Integer maxFileSizeMb) {
        if (Objects.isNull(maxFileSizeMb)) {
            maxFileSizeMb = 15;
        }
        Objects.requireNonNull(file);
        long fileSizeMb = file.length / (1024 * 1024);
        return checkFileExtensionValid(fileName, ".JPG", ".PNG", ".TIFF", ".BMP", ".PDF", ".JPEG", ".WEBP", "RAR", "ZIP", "XLSX", "XLS", "TXT", "DOC", "DOCX") && fileSizeMb <= maxFileSizeMb;
    }
    public static boolean checkFileExtensionValid(String fileName, String... fileExtensions) {
        Objects.requireNonNull(fileName);
        for (String fileExtension : fileExtensions) {
            if (fileName.toLowerCase().endsWith(fileExtension.toLowerCase())) {
                return true;
            }
        }
        return false;
    }

    public static String generateTxId() {
        StringBuilder txId = new StringBuilder("0x");
        for (int i = 0; i < TXID_LENGTH; i++) {
            int index = RANDOM.nextInt(HEX_CHARACTERS.length());
            txId.append(HEX_CHARACTERS.charAt(index));
        }
        return txId.toString();
    }
}
