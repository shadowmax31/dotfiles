syntax clear

syntax case match 

syntax keyword xType dbl int str bool range intDecision strDecision rangeDecision 
syntax keyword xBool true false
syntax keyword xVisibility input output internal
syntax keyword xOther let pub fn

syntax region xComment start="//" end="$"
syntax region xString start=/"/ skip=/\\"/ end=/"/

highlight link xType Type
highlight link xOther Label
highlight link xVisibility @field
highlight link xComment Comment
highlight link xString String
highlight link xBool Boolean

