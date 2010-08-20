Dot Files (Ubuntu version)
==========================

Based on Ryan Bates's dotfiles http://github.com/ryanb/dotfiles !
Tested on Ubuntu 10.04 but should work on any debian based system.


Installation
------------

  `git clone git://github.com/kares/dotfiles ~/.dotfiles`
  
  `cd ~/.dotfiles`
  
  `rake install`


Environment
-----------

Ryan's Mac OS X positive zsh based scripts were updated to work on
Debian/Ubuntu linux with bash as the default command line interpreter.

Ubuntu includes and executes `~/.bashrc` but not `~/.bash_profile` that is 
why during installation it will append `~/.bash_profile` as a source.

Features
--------

I normally place all of my coding projects in ~/code, so this directory 
can easily be accessed (and tab completed) with the "c" command.

  `c railsca<tab>`

There is also an "h" command which behaves similar, but acts on the 
home path.

  `h doc<tab>`

Tab completion is also added to rake and cap commands:

  `rake db:mi<tab>`
  
  `cap de<tab>`

To speed things up, the results are cached in local `.rake_tasks~` and 
`.cap_tasks~`. It is smart enough to expire the cache automatically in 
most cases, but you can simply remove the files to flush the cache.

If you're using Rails, you'll find some handy aliases (below). You can also 
use `show_log` and `hide_log` in `script/console` to show the log inline.
  
  `ss       # script/server`
  
  `sc       # script/console`
  
  `sg       # script/generate`
  
  `tlog     # tail -f log/development.log`

See and customize the aliases in `~/.bash/aliases`

If there are some shell configuration settings which you want secure or 
specific to one system, place it into a `~/.localrc` file. This will be 
loaded automatically if it exists.

There are several features enabled in Ruby's irb including history and 
completion. Many convenience methods are added as well such as "ri"
which can be used to get inline documentation in IRB. See `irbrc` and
`railsrc` files for details.


