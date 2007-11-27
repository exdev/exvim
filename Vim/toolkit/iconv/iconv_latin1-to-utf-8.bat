echo off
for /R %1 %%i in (*.c *.cpp *.cxx *.c++ *.C *.h *.H *.hh *.hxx *.hpp *.inl *.uc *.hlsl *.vsh *.psh *.fx *.fxh *.cg *.shd *.txt) do ( 
        echo Converting %%i... 
        iconv -c -f latin1 -t utf-8 "%%i" > "%%i.cov"
        copy "%%i.cov" "%%i" )
goto Finish
:Finish
echo on
