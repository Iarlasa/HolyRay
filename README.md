# HolyRay
HolyC bindings for Raylib <br>
I have only added support for rcore so far, the other modules will take some time <br>

This uses the HolyC compiler by James Barford (https://github.com/Jamesbarford/holyc-lang) <br> <br>
This HolyC natively has support for C libraries, you simply link them in the hcc command like so <br>
```hcc Main.HC -clibs='-lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -Wall -I ./include/ -L ./lib/' -o build```
<br> In this snippet, -clibs='__' links the Main.HC to the C libraries. <br>
After that, you just have to use ```extern "c" U0 funcName();``` to access in in your HolyC code. Putting that at the top of your script allows you to use funcName() as you would normally. <br> <br>
In this binding, all i did was take the raylib.h file, convert all data types to HolyC ones, add extern "c" before functions, and change enums to #define. Some things i was not able to convert to HolyC, like callable functions ( *TraceLogCallback for example ), and raylibs custom memory allocators ( like RL_MALLOC ). <br>

Other things had to be changed, for example all the color macros at the top like #define RAYWHITE {245, 245, 245, 255} had to be changed to variables, as HolyC only allows #define to use numbers or strings. <br> <br>
