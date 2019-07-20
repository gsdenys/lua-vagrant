# Lua Vagrant #

The [Lua](https://www.lua.org) [Vagrant](https://www.vagrantup.com) environment. This use the [luajit-rocks](https://github.com/torch/luajit-rocks) that provides [LuaJIT](http://luajit.org) and [Luarocks](https://luarocks.org) in just one location.

## Usage ##

The use of this project is very easy, just execute the following command ([Vagrant](https://www.vagrantup.com) need to be installed):

```sh
# clone this repository
https://github.com/gsdenys/lua-vagrant.git
cd lua-vagrant

# Starts and access VM
vagrant up # it may takes many time
vagrant ssh 
```
The directory that map de host is __/lua/__
