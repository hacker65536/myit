# jmeter tutorial
```
http://jmeter.apache.org/download_jmeter.cgi
```

1. download
2. unzip (if have bad CRC error ,use command line)
3. jmeter.bat (windows)


----
1. add thread group
2. add http request ( from sampler)
3. add view results tree ( from listener)
4. add view results in table (from listener)


---

thread group
-----------

1. number of threads (users)
2. ramp-up period
3. loop count



thread count = 20,ramp up time (sec) = 100 & loop count=1  
20 / 100 = 0.2 thread/sec   =  every 5 secounds 1 thread  

thread count = 100,ramp up time (sec) = 60 & loop count=3  
100 * 3 / 60 = 5  = 5 request(threads) in 1sec
