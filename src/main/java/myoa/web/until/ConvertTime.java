package myoa.web.until;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ConvertTime {
	/**
	 * 日期转换成长字符串
	 * 
	 * @param date
	 * @return str
	 */
	public static String DateToLongStr(Date date) {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = format.format(date);
		return str;
	}
	/**
	 * 日期转换成时:分:秒字符串
	 * 
	 * @param date
	 * @return str
	 */
	public static String DateToTimeStr(Date date) {

		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		String str = format.format(date);
		return str;
	}

	/**
	 * 日期转换成短字符串
	 * 
	 * @param date
	 * @return str
	 */
	public static String DateToShortStr(Date date) {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(date);
		return str;
	}

	/**
	 * 字符串转换成日期
	 * 
	 * @param str
	 * @return date
	 */
	public static Date StrToDate(String str) {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * 时间添加天数
	 * @param date 输入时间
	 * @param day 输入添加天数	
	 * @return
	 */
	public static Date getAddDay(Date date,int day) {
		Calendar calendar = Calendar.getInstance();
		//Calendar.WEDNESDAY为当前周数
		//Calendar.DAY_OF_WEEK为当前星期几，从星期日开始计算
		//int week= calendar.get(Calendar.WEDNESDAY);
		//System.out.println("week的值为："+week);
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, +day);// +day今天的时间加day天
		date = calendar.getTime();
		//week= calendar.get(Calendar.WEDNESDAY);
		//System.out.println("week的值为："+week);
		return date;
	}
	
	public static void main(String[] args) {
		Date date = new Date();
		System.out.println(date.getTime());
		System.out.println("日期转字符串(短)：" + ConvertTime.DateToShortStr(date));
		System.out.println("日期转字符串(长)：" + ConvertTime.DateToLongStr(date));
		System.out.println("字符串转日期：" + ConvertTime.StrToDate(ConvertTime.DateToLongStr(date)));
		int day=20;
		System.out.println("当前时间为"+ConvertTime.DateToLongStr(date)+"添加天数为"+day);
		System.out.println("更改后的时间为"+ConvertTime.DateToLongStr(ConvertTime.getAddDay(date, day)));
	}
}
