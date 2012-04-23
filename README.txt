Static Library for Xcode 4 and iOS

1) Create a workspace
2) Add a Static Library to the project
3) In Build Settings set Targetted Device Family to iPhone/iPad (Universal)
4) Manager Copy Headers in Build Phases for Public/Private access
5) Add reference in Build Phases with Link Binary with Libraries
6) In Building Settings add $(BUILT_PRODUCTS_DIR) to Header Search Paths (with checkbox checked)
7) If there are categories in the Static Library, add -all_load to Other Linker Flags under Linking
8) Ensure all frameworks needed by the Static Library are also added to the main app
