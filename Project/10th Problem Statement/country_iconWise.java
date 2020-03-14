package training;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

public class country_iconWise extends UDF{
	public Text evaluate(int i)
	{
		Text t = new Text();
		if(i == 0)
		{
			t.set(new String("There is no icon in the Flag"));
		}
		else if (i == 1)
		{
			t.set(new String("There is icon in the Flag"));
		}
		return t;
	}

}
