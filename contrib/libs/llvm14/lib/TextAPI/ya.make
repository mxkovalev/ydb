# Generated by devtools/yamaker.

LIBRARY()

VERSION(14.0.6)

LICENSE(Apache-2.0 WITH LLVM-exception)

LICENSE_TEXTS(.yandex_meta/licenses.list.txt)

PEERDIR(
    contrib/libs/llvm14
    contrib/libs/llvm14/lib/BinaryFormat
    contrib/libs/llvm14/lib/Support
)

ADDINCL(
    contrib/libs/llvm14/lib/TextAPI
)

NO_COMPILER_WARNINGS()

NO_UTIL()

SRCS(
    Architecture.cpp
    ArchitectureSet.cpp
    InterfaceFile.cpp
    PackedVersion.cpp
    Platform.cpp
    Symbol.cpp
    Target.cpp
    TextStub.cpp
    TextStubCommon.cpp
)

END()
