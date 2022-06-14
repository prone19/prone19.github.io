# Perf Theory

[Back to HOME](https://prone19.github.io/)

## Perf Basics
* [perf_from_scratch.pptx](assets/perf_from_scratch.pptx) - basics from TG
* [load.qa](https://load.qa/) \ [qaload.github.qa](https://github.com/qaload/qaload.github.io) - Knw base from TG
* [github.com/aliesbelik/awesome](https://github.com/aliesbelik/awesome) - jmeter knw base
* [training.by](https://training.by/#!/Training/2957?lang=ru) -  epam for juniors

### Load profile
1. [LT_Profile](https://github.com/pflb/LT_Profile)
2. [presentation](https://docs.google.com/presentation/d/1Vfw6_FIYxJxfsIW1-OFaj-SOmLZYUkJuM-k7wvcNhAE/edit#slide=id.g8977d36562_0_81)
3. [true approach to make load profile](https://sqadays.com/ru/talk/52678)

### Analysis
1. [https://habr.com/ru/company/tinkoff/blog/514314/](https://habr.com/ru/company/tinkoff/blog/514314/)

### Metrics
Setup Server Side Monitoring(for Web and APP servers) with following metrics  
1. CPU utilization
2. Memory utilization
3. Network bytes total per sec
4. Network output queue length
5. Disk queue length
6. Disk transfer per sec

Setup Server Side Monitoring(for DB servers) with following metrics  
1. CPU utilization
2. Memory utilization
3. Network bytes total per sec
4. Network output queue length
5. Disk queue length
6. Disk transfer per sec
7. Page life expectancy
8. Access Methods\Full Scans/sec
9. Buffer Manager\Page writes/sec
10. Buffer Manager\Page reads/sec

### Rampup and test types
рампам хитрая штука. Можно сделать так, чтобы заходило по 2-4 пользователя в секунду, от этого скачет рампам, но тут зависит от того, как система работает с подаваемым ростом нагрузки.

В стресс тесте обычно дюрейшен=рампам.
Вообще, дюрейшен для стресс обычно 30-60 минут. 
Если 4К пользователей и рампам 60 минут, то это по 1 пользователю в секунду. 
Надо смотреть, как ведёт себя с система с самого начала теста. 
Возможно такая интенсивность для системы будет ту мачь и она так не протянет и 30 минут. 
Тогда можно будет ставить, например, по 2 пользователя в секунду. это будет рампам 8000 секунд (~130 минут, ~2,5 часа).

Для лоад теста дюрейшен обычно 2-8 часов. 4 вполне ок, не обязательно больше 5 часов. Считай лимит лодиума не помеха.

Если мы во время стресса поймём, что система не выдерживает 4000 пользователей, то и лоад у нас будет 80% пользователей от максимум во время стресса. 
Тут тоже рампап выставлять такой, при котором система будет спокойно себя чувствовать (при стрессе обычно интенсивность больше, чем ожидаемая).

Стресс:
- ищем максимум. Пробуем 4000 пользователей, дюрейшен = рампам. Пробуем делать запуски 1-2-3-4 пользователя в секунду, 
  доходим до 4000 (или максимума, который система выдержит (когда-то кидала стоп-критерии для стресс теста)) пользователей и стопаем тест.

Лоад:
- смотрим, как система себя ведёт при стабильной нагрузке.   
  Подаём желаемый рост пользователей (на основе стресс теста).   
  Например, знаем, что система хорошо справляется с росто 2 пользователя в секунду, запускаем так, в зависимости от того, сколько максимум пользователей будет при лоаде. 
  Пусть будет 3000 пользователей. Тогда запускаем за 1500 секунд (25 минут) 3000 пользователей (2 в секунду) и держим часа 2-3.

Краткая выжимка от Саши Ханевского:  
для лоада - главное, чтобы не валилось  
для стресса - прирост пользователей должен быть быстрее ожидаемого на продуктиве  
на скалабилити - обсуждается с разрабами  
на пиклоаде - рампап с разной интенсивностью   