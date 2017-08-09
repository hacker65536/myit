
```
yum install R
```



## sample

http://to-kei.net/r-beginner/r-2/


```
cat <<'EOF' > sample-data.csv
番号,年齢,血圧,肺活量,性別,病気,体重
1,22,110,4300,M,1,79
2,23,128,4500,M,1,65
3,24,104,3900,F,0,53
4,25,112,3000,F,0,45
5,27,108,4800,M,0,80
6,28,126,3800,F,0,50
7,28,126,3800,F,1,43
8,29,104,4000,F,1,55
9,30,125,3600,F,1,47
10,31,120,3400,F,1,49
11,32,116,3600,M,1,64
12,32,124,3900,M,0,61
13,33,106,3100,F,0,48
14,33,134,2900,F,0,41
15,34,128,4100,M,1,70
16,36,128,3420,M,1,55
17,37,116,3800,M,1,70
18,37,132,4150,M,1,90
19,38,134,2700,F,0,39
20,39,116,4550,M,1,86
21,40,120,2900,F,1,50
22,42,130,3950,F,1,65
23,46,126,3100,M,0,58
24,49,140,3000,F,0,45
25,50,156,3400,M,1,60
26,53,124,3400,M,1,71
27,56,118,3470,M,1,62
28,58,144,2800,M,0,51
29,64,142,2500,F,1,40
30,65,144,2350,F,0,42
EOF
```

```
$ R

R version 3.3.3 (2017-03-06) -- "Another Canoe"
Copyright (C) 2017 The R Foundation for Statistical Computing
Platform: x86_64-redhat-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> df <- read.csv("sample-data.csv",header=T,row.names=1)
> df[1,]
  年齢 血圧 肺活量 性別 病気 体重
1   22  110   4300    M    1   79
> df[,1]
 [1] 22 23 24 25 27 28 28 29 30 31 32 32 33 33 34 36 37 37 38 39 40 42 46 49 50
[26] 53 56 58 64 65
```

