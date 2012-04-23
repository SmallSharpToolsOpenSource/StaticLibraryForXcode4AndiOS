Static Library for Xcode 4 and iOS
----------------------------------

Creating a Static Library is a great way to reuse code in a project but with Xcode 4 it can be 
difficult to set up if you do not know the following steps to set it up. And if your Static Library
defines Categories, which are dynamic, you need to take an extra step to ensure your implementation
links everything so it is all available at run-time. This GitHub project is made available as a 
working example.  

Steps
-----

1. Create a workspace
2. Add a Static Library to the project
3. In Build Settings set Targeted Device Family to iPhone/iPad (Universal)
4. Manager Copy Headers in Build Phases for Public/Private access
5. Add iOS application
6. In application's Build Phases, add reference to Static Library under Link Binary with Libraries
7. In Building Settings add $(BUILT_PRODUCTS_DIR) to Header Search Paths (with checkbox checked)
8. Add -ObjC or -all_load to Other Linker Flags under Linking (see Linker Flags below)
9. Ensure all frameworks needed by the Static Library are also added to the main app
10. Build and run the app to test that it works and verify all steps were followed

See StaticLibraryLinking.png for example of Other Linker Flags  

Linker Flags
------------

If a Static Library has Categories it may be necessary to tell it to load the dynamic implementation.
Below are the definitions for these Linker Flags. Use them in Step 8 to make it work for your build.

#### -all_load 

Loads all members of static archive libraries.

#### -ObjC 

Loads all members of static archive libraries that implement an Objective-C class or category.

#### -force_load (path_to_archive) 

Loads all members of the specified static archive
library. Note: -all_load forces all members of all archives to be loaded. 
This option allows you to target a specific archive.

#### Apple Technical Q&A QA1490 

Q:  Why do I get a runtime exception of "selector not recognized" when linking against an Objective-C 
static library that contains categories? http://sstools.co/IkojjA  

To learn more pick up Pro iOS 5 Tools from Apress. See Chapter 11 titled 
"How Do I Share Some of This?" (http://sstools.co/IklJKs)  

SmallSharpTools  
Brennan Stehling  
http://twitter.com/SmallSharpTools  

Apache License, Version 2.0  
