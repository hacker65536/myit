

```shell
function aft-pipeline-status() {

  local acclist=$(
    export AWS_PROFILE=<AWS_MNG_ACCOUNT>
    aws organizations list-accounts --query 'Accounts[?Status==`ACTIVE`].[Id,Name]' --output text | sort | sed -e 's/ /_/'

  )
  local pipelinelist=($(
    export AWS_PROFILE=<AFT_MNG_ACCOUNT>
    aws codepipeline list-pipelines --query 'pipelines[?ends_with(name,`customizations-pipeline`)].name.[@]' --output text
  ))

  local pipelinestats=$(
    export AWS_PROFILE=<AFT_MNG_ACCOUNT>
    echo "$pipelinelist" | xargs -n 1 | xargs -P 10 -I{} bash -c $'printf "%s %s\n" "$(echo \"{}\"| gsed -r -e \'s/([0-9]{12})(.*)/\\1  \\1\\2/\')" "$(aws codepipeline list-pipeline-executions --pipeline-name {} --query \'pipelineExecutionSummaries[0].[pipelineExecutionId,status,lastUpdateTime,sourceRevisions[?actionName==\`aft-global-customizations\`].actionName|[0],sourceRevisions[?actionName==\`aft-global-customizations\`].revisionId|[0],sourceRevisions[?actionName==\`aft-account-customizations\`].actionName|[0],sourceRevisions[?actionName==\`aft-account-customizations\`].revisionId|[0]]\' --output text)"'
  )

  join -a 1 -e NULL -1 1 -2 1 <(echo $acclist) <(echo $pipelinestats | sort)

}
```
