syntax clear

syntax case match 

syntax keyword xType dbl int str bool range intDecision strDecision rangeDecision boolDecision
syntax keyword xBool true false
syntax keyword xVisibility input output internal global
syntax keyword xOther let pub fn view

syntax region xComment start="//" end="$"
syntax region xString start=/"/ skip=/\\"/ end=/"/

highlight link xType Type
highlight link xOther Label
highlight link xVisibility @field
highlight link xComment Comment
highlight link xString String
highlight link xBool Boolean

