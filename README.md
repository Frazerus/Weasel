# Weasel
Weasel Engine

## Assignment 1

### What is the difference between git and github?
Github is a website where git repositories are hosted, git is the actual version control system which handles how files are saved, committed, pushed, pulled and so on.
### Name 3 benefits of a version control system:
- Easy experimentation with branches, merging and resetting
- History of everything that happened
- concurrent working on different branches & with local changes
### Name 3 alternatives to git:
- Mercurial
- Subversion
- Perforce
### Name 2 differences between git and other version control systems:
Git vs SVN (Subversion)
- branches only refer to specific commit vs branches created as directories inside repository
- each installation can be server and client vs separate client and server where files are stored, files only locally as copy -> constant communication with server
### Name known issues related to game engines (Unreal, Unity) and version control systems:
- git handles binary files terribly -> evey binary file is kept at any time on every development machine -> giant repositories


## Assignment 2

### Describe a logging system with your own words:
A logging system is a system that provides logging functionality. Logging functionality is the ability to keep a log of events that occur in an application. These events might be errors, debug info, warnings or just simple info. 
### What is the difference between git submodules and git subtrees?
Submodules save data about the child project, enabling other to clone those changes, subtrees simply copy the whole child project into the parent project. 
Submoduels therefore need access to the server of where the project is located as well as the parent project, subtrees only need access to the server hosting the parent project.
### What is a build system in C++? Name 3 build systems:
A build system simplifies and automates running the compiler and linker. The have to be configured to work though.
- premake
- cmake 
- ninja
### What is a package manager in C++? Name 3 package manager:
Package managers in c++ let developers capture artifacts that are created by builds of libraries and applications to store them inside packages. These are uploaded to some repository, for ease of getting llibraries and applications into one's own application.
- conan
- vcpkg
- spack

## Asignment 3

### What is the difference between a dynamic linked library and a static library?
In static linking, a copy of the library is directly part of the executable. In dynamic linking, the combination happens during runtime.
### Describe a logging system with your own words:
A logging system is a system that provides logging functionality. Logging functionality is the ability to keep a log of events that occur in an application. These events might be errors, debug info, warnings or just simple info. 
### What is a Design Pattern?
A solution to a typical and often occuring problem in the designing of software. Several types: 
- Creational
- Structural
- Behavioral
### Name and describe 2 Design Patterns (except façade or adapter):
- Strategy (behavioral): Some class (context) may do something specific in different ways. To enable this behaviour, the specific part should be a strategy, which simply implements the strategy interface. The context then only needs to call the method of the strategy interface, the implementation of which was supplied by its caller, to use the specific functionality. 
- Visitor (behavioral): Place wanted behaviour of classes that should no be changed into a new visitor class. The original class is passed to the visitor for it to access the required data. With several different classes, a visitor might implement several methods.
To call the visitors behavior, the original class should have a method to accept a visitor and call the correct method. This way the og class was changed in a trivial way, and if the need arises again it can be extended without further changes. 
