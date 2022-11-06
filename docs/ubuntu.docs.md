Traditionally, personal shell scripts go in your ~/bin directory which you add to your path. Personal code libraries (for C at least) go in ~/lib and header files in ~/include. In other words, mirroring the filesystem hierarchy standard.

http://en.wikipedia.org/wiki/Filesystem_hierarchy_standard

You could follow on that theme, depends a lot on what you are developing. For me that's as far as I take it.

All my development projects go under ~/Development, sub-divided by language and then project. Documentation tends to go in my ~/Dropbox folder because I sometimes need to access it from a web browser if I am working away, or it might go in ~/Documents. Any local software (e.g. web application servers) I put under ~/Software. Java libraries go into a Maven repository on my server, Java code goes into a Subversion repository and gets rebuilt automatically with Hudson.

If you are doing kernel work, you'll become familiar with git which takes a lot of legwork out of managing multiple versions of source code. You can just have one kernel directory tree and switch branches.

Filing on your own machine is a personal thing and changes over time. No need to worry too much about it. Just try and recognise when it's getting out of hand and needs reorganising - that also applies to the filing of email, bookmarks, etc.