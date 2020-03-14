package training;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public class textDetails extends UDF {
	public Text evaluate(int i)
	{
		Text t = new Text();
		if (i == 1)
		{
			t.set(new String("Text is there in the Flag"));
		}
		return t;
	}
}
