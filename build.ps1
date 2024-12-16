$env:PATH="C:\Tools\bison\Bison.3.7.4\bin;" + $env:PATH
$PCRE_ROOT="C:\Tools\pcre2\PCRE2.10.39.0"
$PCRE_PLATFORM="x64"

cmake -G "Visual Studio 17 2022" -A "x64" `
-DCMAKE_INSTALL_PREFIX="D:/CODE/swig/install2" `
-DCMAKE_C_FLAGS="/DPCRE2_STATIC" `
-DCMAKE_CXX_FLAGS="/DPCRE2_STATIC" `
-DPCRE2_INCLUDE_DIR="$PCRE_ROOT/include" `
-DPCRE2_LIBRARY="$PCRE_ROOT/lib/pcre2-8-static.lib" `
-S . -B build

cmake --build build --config Release
cmake --install build --config Release

# to test the exe built correctly
cd install2/bin
./swig.exe -version
./swig.exe -help

[Console]::ReadKey() > $null