package com.chon.api.utils;

import java.util.Calendar;
import java.util.Date;

public class DateTimeUtils {
    public static Date addTime(int minute) {
        Calendar dNow = Calendar.getInstance();
        dNow.add(Calendar.MINUTE, minute);

        return dNow.getTime();
    }
}
