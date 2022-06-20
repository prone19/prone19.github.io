# JMeter

[Back to HOME](https://prone19.github.io/)


### DSL Jmeter
[https://habr.com/ru/company/otus/blog/653823/](https://habr.com/ru/company/otus/blog/653823/)
[https://abstracta.github.io/jmeter-java-dsl/](https://abstracta.github.io/jmeter-java-dsl/)  
[https://github.com/abstracta/jmeter-java-dsl](https://github.com/abstracta/jmeter-java-dsl)  
[https://abstracta.github.io/jmeter-java-dsl/guide/#java-api-performance-testing](https://abstracta.github.io/jmeter-java-dsl/guide/#java-api-performance-testing)  
[https://github.com/grpc/grpc-java](https://github.com/grpc/grpc-java)  

### Try/catch jmeter
[trycatch.jmx](TryCatch.jmx)

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

swithch from a range
```groovy
def rnd = vars.get("rnd") as int

int result = 0

range = [
	0..15,
	15..28,
	28..38,
	38..47,
	47..55,
	55..59,
	59..66,
	66..69,
	69..75,
	75..79,
	79..82,
	82..85,
	85..88,
	88..91,
	91..94,
	94..97,
	97..100
]
		
for (def i = 0; i < range.size; i++) {
	if ( rnd in range[i] ) {
		result = i
		break
	}
}

vars.put("switch_value", result.toString())

SampleResult.setIgnore();
```