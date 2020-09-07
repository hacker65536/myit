
```console
$ sudo apt install distro-info
```
```console
$ ubuntu-distro-info --supported -yeol -f
Ubuntu 16.04 LTS "Xenial Xerus" 226
Ubuntu 18.04 LTS "Bionic Beaver" 961
Ubuntu 20.04 LTS "Focal Fossa" 1689
Ubuntu 20.10 "Groovy Gorilla" 318
```

```console
$ ubuntu-distro-info --supported -yeol -f | sed "s/.* \([0-9]*\)/echo -n '           &\r';date -d+\1day +%F/e"
2021-04-21 Ubuntu 16.04 LTS "Xenial Xerus" 226
2023-04-26 Ubuntu 18.04 LTS "Bionic Beaver" 961
2025-04-23 Ubuntu 20.04 LTS "Focal Fossa" 1689
2021-07-22 Ubuntu 20.10 "Groovy Gorilla" 318
```

```console
$ ubuntu-distro-info --all -yeol -f
Ubuntu 4.10 "Warty Warthog" -5244
Ubuntu 5.04 "Hoary Hedgehog" -5060
Ubuntu 5.10 "Breezy Badger" -4896
Ubuntu 6.06 LTS "Dapper Drake" -4073
Ubuntu 6.10 "Edgy Eft" -4518
Ubuntu 7.04 "Feisty Fawn" -4341
Ubuntu 7.10 "Gutsy Gibbon" -4160
Ubuntu 8.04 LTS "Hardy Heron" -3406
Ubuntu 8.10 "Intrepid Ibex" -3783
Ubuntu 9.04 "Jaunty Jackalope" -3607
Ubuntu 9.10 "Karmic Koala" -3419
Ubuntu 10.04 LTS "Lucid Lynx" -2678
Ubuntu 10.10 "Maverick Meerkat" -3072
Ubuntu 11.04 "Natty Narwhal" -2871
Ubuntu 11.10 "Oneiric Ocelot" -2678
Ubuntu 12.04 LTS "Precise Pangolin" -1230
Ubuntu 12.10 "Quantal Quetzal" -2306
Ubuntu 13.04 "Raring Ringtail" -2415
Ubuntu 13.10 "Saucy Salamander" -2244
Ubuntu 14.04 LTS "Trusty Tahr" -501
Ubuntu 14.10 "Utopic Unicorn" -1873
Ubuntu 15.04 "Vivid Vervet" -1689
Ubuntu 15.10 "Wily Werewolf" -1508
Ubuntu 16.04 LTS "Xenial Xerus" 226
Ubuntu 16.10 "Yakkety Yak" -1145
Ubuntu 17.04 "Zesty Zapus" -968
Ubuntu 17.10 "Artful Aardvark" -781
Ubuntu 18.04 LTS "Bionic Beaver" 961
Ubuntu 18.10 "Cosmic Cuttlefish" -417
Ubuntu 19.04 "Disco Dingo" -233
Ubuntu 19.10 "Eoan Ermine" -52
Ubuntu 20.04 LTS "Focal Fossa" 1689
Ubuntu 20.10 "Groovy Gorilla" 318
```


https://askubuntu.com/questions/1126909/when-is-the-exact-date-for-eol-of-ubuntu-14-04-lts
