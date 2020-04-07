
`~/.config/fish/functions/s2a.fish`
```fish
function s2a -d "saml2aws optimize"

  switch $argv
    case sand sandbox
      # sandbox
       set idpconf sandbox
    case prd production
      # production
       set idpconf production
    case '*'
      # default sandbox
       set idpconf sandbox
  end

  # saml2aws login
  $GOPATH/bin/saml2aws login -a $idpconf --skip-prompt --force
  
  # export AWS_PROFILE=$idpconf
  set -xg  AWS_PROFILE $idpconf

  # set universal
  set -U aws_profile_{$AWS_PROFILE}_alias (aws iam --profile $AWS_PROFILE list-account-aliases --query 'AccountAliases[0]' --output text) 2>/dev/null
  set -U aws_profile_{$AWS_PROFILE}_expire (gdate -d (aws configure --profile $AWS_PROFILE get x_security_token_expires) +%s)  2>/dev/null
  
  # aws configure set
  aws configure --profile $AWS_PROFILE set account_alias (eval echo '$'aws_profile_{$AWS_PROFILE}_alias)

end
```

`~/.config/fish/functions/fish_right_prompt.fish`
```fish
function fish_right_prompt -d "Write out the right prompt"
#   date '+%m/%d/%y'
    set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
    if begin ;
        set -q AWS_PROFILE
        and set -q aws_profile_{$AWS_PROFILE}_expire
        and test (gdate +%s) -lt (eval echo '$'aws_profile_{$AWS_PROFILE}_expire)
       ; end

       eval echo '$'aws_profile_{$AWS_PROFILE}_alias
       #aws configure --profile $AWS_PROFILE get acount_alias
    end
  set_color normal
end
```
