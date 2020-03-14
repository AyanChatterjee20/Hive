package training;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public class ZoneDetails extends UDF{
	public Text evaluate(String s)
	{
		Text t = new Text();
		if(s.equals("1"))
		{
			t.set(new String("NE"));
		}
		else if (s.equals("2"))
		{
			t.set(new String("SE"));
		}
		else if (s.equals("3"))
		{
			t.set(new String("NW"));
		}
		else if (s.equals("4"))
		{
			t.set(new String("SW"));
		}
		return t;
	}

}
