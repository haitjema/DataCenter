Note: 
These generated files are huge and the OMNeT++ IDE can slow to a crawl trying to check them for errors.

I added a filter to my DataCenter project to hide the "generatedOutsideOmnet" folder from OMNeT.
Right click the project, chose project settings.
Click the "Resource" tree and chose "Resource Filters".
I added a "Exclude all:" filter with the following settings:
Filter type: Exclude all
Applies to: Files and folders 
"All Children (recursive) is checked.
Location	matches		"/Users/Mart/Research/Simulation/Workspace/DataCenter/results/local/hide_from_omnet_ide"

To be sure, I added a second filter, this time by specifying a project relative path:
src/model/networks/fattree/generatedOutsideOmnet.


Whenever you refer to the ned files in the filtered out folder, OMNeT will complain that it can't find it but you should be able to ignore the errors and still launch and debug simulations using the referenced files from the IDE.

I tried using "ln -s" to symbolically link the commonly used, smaller NED files one directory level up.
The problem is that the NED project path will be incorrect since the file is suppose to be under "generatedOutsideOmnet".
I just copied the FatTree_4_2_3.ned file up one level so if I edit it, I need to be sure to make the changes in both places.

