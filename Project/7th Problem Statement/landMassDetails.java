package training;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public class landMassDetails {
	public Text evaluate(String s)
	{
		Text t = new Text();
		if(s.equals("1"))
		{
			t.set(new String("N.AMERICA"));
		}
		else if (s.equals("2"))
		{
			t.set(new String("S.AMERICA"));
		}
		else if (s.equals("3"))
		{
			t.set(new String("EUROPE"));
		}
		else if (s.equals("4"))
		{
			t.set(new String("AFRICA"));
		}
		else if (s.equals("5"))
		{
			t.set(new String("ASIA"));
		}
		else if (s.equals("6"))
		{
			t.set(new String("OCENIA"));
		}
		return t;
	}

}
