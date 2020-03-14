package training;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public class languageDetails extends UDF {
	public Text evaluate(String s)
	{
		Text t = new Text();
		if(s.equals("1"))
		{
			t.set(new String("ENGLISH"));
		}
		else if (s.equals("2"))
		{
			t.set(new String("SPANISH"));
		}
		else if (s.equals("3"))
		{
			t.set(new String("FRENCH"));
		}
		else if (s.equals("4"))
		{
			t.set(new String("GERMAN"));
		}
		else if (s.equals("5"))
		{
			t.set(new String("SLAVIC"));
		}
		else if (s.equals("6"))
		{
			t.set(new String("INDO-EUROPEAN"));
		}
		else if (s.equals("7"))
		{
			t.set(new String("CHIENSE"));
		}
		else if (s.equals("8"))
		{
			t.set(new String("ARABIC"));
		}
		return t;
	}
}

