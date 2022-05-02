# JMeter

[Back to HOME](https://prone19.github.io/)


### DSL Jmeter
https://habr.com/ru/company/otus/blog/653823/

### Groovy
From *int* to *string*
```groovy
// get int, compute, convert to string
import org.apache.commons.math3.util.Precision

def projects_count = vars.get("projects_count") as int
page_count = projects_count / 20

//page_count = Math.round(page_count * 100) / 100
page_count = page_count.round(0)

vars.put("page_count", page_count.toString())
```

Check Java version:
```groovy
log.info('Java version: ' + System.getProperty('java.version'))
java.lang.management.ManagementFactory.getRuntimeMXBean().getInputArguments().each {
log.info("Effective JVM argument: " + "$it")
}
```

Random date:
```groovy
import java.text.SimpleDateFormat;
import java.util.Calendar;

calendar = Calendar.getInstance();
calendar.set(2015, 01, 01);
startTime = calendar.getTimeInMillis();
calendar.set(2022, 04, 27);
endTime = calendar.getTimeInMillis();
randomTime1 = startTime + (long)(Math.random()*(endTime-startTime));
randomTime2 = randomTime1 + (long)((randomTime1/100));

formatter = new SimpleDateFormat("yyyy-MM-dd");
calendar.setTimeInMillis(randomTime1);
vars.put("start", formatter.format(calendar.getTime()));
calendar.setTimeInMillis(randomTime2);
vars.put("end", formatter.format(calendar.getTime()));
```