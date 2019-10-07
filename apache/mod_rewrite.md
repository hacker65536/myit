# mod_rewrite


https://httpd.apache.org/docs/current/mod/mod_rewrite.html



logging
--

https://httpd.apache.org/docs/current/mod/core.html#loglevel


```apache
LogLevel debug rewrite:trace8
```


RewriteBase 
--
https://httpd.apache.org/docs/current/mod/mod_rewrite.html#rewritebase

used for per-directory (htaccess)

```apache
RewriteBase "/myapp/"
```


RewriteCond 
--

https://httpd.apache.org/docs/current/mod/mod_rewrite.html#rewritecond

- NC = no case (ignore lower,uppercase)
- OR = or next condition

```apache
RewriteCond "%{REMOTE_HOST}"  "^host1"  [OR]
RewriteCond "%{REMOTE_HOST}"  "^host2"  [OR]
RewriteCond "%{REMOTE_HOST}"  "^host3"
RewriteRule ...some special stuff for any of these hosts...
```


RewriteRule 
--
https://httpd.apache.org/docs/current/mod/mod_rewrite.html#rewriterule

### flag and syntax

https://httpd.apache.org/docs/current/rewrite/flags.html

- L (last)
- F (forbidden)
