

```console
crontab -e
```

```crontab
0 17 */3 * mon cp ~/.zsh_history ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/zsh_history_$(date +\%Y_\%m_\%d).bak
```
