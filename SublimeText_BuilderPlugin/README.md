#README 
----------------
1. description
2. requirement
3. installation
4. test building
5. contact
6. license

#descrption
POC. build Carbon application from sublime text 2\3.
<br/><br/>

1.Build Carbon App (CAR) Archive form project folder
build car file that can be uploaded on wso2 esb

#system requirements
* OS: Windows with cygwin
* shell requirements: bash, awk, sed, zip, find
* other: SublimeText

#installation
* move file stcarbuilder.sh to your home dir in cygwin.
* open sublime text, go to Tools > Build system > New Build system
* copy - paste content of wso2.sublime-build to new build system file
* check and replace (if need) path to cygwin and path to script stcarbuilder.sh.
* save. For example as wso2.sublime-build

#test building
* file structure of project sould be like that and plcaed under cygwin in your home dir:
```
testproject
└── src
    └── main
        ├── dataservice
        │   └── testdss.dbs
        └── synapse-config
            ├── api
            ├── endpoints
            ├── local-entries
            ├── message-processors
            ├── message-stores
            ├── proxy-services
            │   └── testPrx.xml
            ├── sequences
            ├── tasks
            └── templates

```
* open sublime text and select open folder, select path to "testproject"
* select Tools > Build system > wso2
* press Ctrl+B or Tools > Build
* look at the output string:

```
car is here:/cygdrive/C/cygwin64/home/user/testproject/CARFile_0.0.1/testproject_0.0.1.car

```
* upload car to wso2 esb



#contact
razblade@gmail.com

#license
The MIT License (MIT)
<br/>
Copyright (c) 2012,2013,2014
<br/>
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
<br/>
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
<br/>
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


