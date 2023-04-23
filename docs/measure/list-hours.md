# Using git time

## Installing

Git time needs to be installed globally on npm:

`https://github.com/vmf91/git-time#readme`

# Using

Then you can run:

`git-time`

## Git log

`git log --pretty=format:"%h%x09%an%x09%ad%x09%s"`

with colors 

`git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short`


git log --pretty='%cd %ce %s' --graph --date=iso --date-order


