```console
$ curl -I --retry 5 wwwa.yahoo.co.jp
Warning: Transient problem: timeout Will retry in 1 seconds. 5 retries left.
Warning: Transient problem: timeout Will retry in 2 seconds. 4 retries left.
Warning: Transient problem: timeout Will retry in 4 seconds. 3 retries left.
Warning: Transient problem: timeout Will retry in 8 seconds. 2 retries left.
Warning: Transient problem: timeout Will retry in 16 seconds. 1 retries left.
curl: (6) Could not resolve host: wwwa.yahoo.co.jp
```


```bash
function retry_command() {
    local -r __tries="$1"; shift
    local -r __run="$@"
    local -i __backoff_delay=2

    until $__run
        do
                if (( __current_try == __tries ))
                then
                        echo "Tried $__current_try times and failed!"
                        return 1
                else
                        echo "Retrying ...."
                        sleep $((((__backoff_delay++)) + ((__current_try++))))
                fi
        done

}

retry_command 20 curl xxxx.host.com
```
