# Bloom Lab ImageJ2/FIJI Macros
This repository contains the commonly used (yet quick and dirty) ImageJ2/FIJI macros. A detailed description of each is below.
* hyper_split.ijm
* timelapse_nd2_split_dir.ijm
## hyper_split.ijm
This macro prompts the user for a hyperstack composed of three color channels and timepoints (the Z-dimension was projected using maximum intensity) and a set of regions of interest (ROIs). The macro iterates through the list of ROIs, duplicating the frame (keeping the color channels, but **NOT** duplicating the other timepoints of the hyperstack), and saving the duplicated regions as a TIFF hyperstack (contains the three color channels).

This macro was originally written to parse the SMC3-GFP, SPC29-RFP cells from .stk/.tif files acquired using MetaMorph. Using ImageJ2/FIJI the GFP and RFP stacks were converted to hyperstacks, maximum intensity projected, and merged along with the Trans channel. This hyperstack was saved as a .tif file and the ROIs were selected from this hyperstack. The ROIs must be saved to a zip file.

## timelapse_nd2_split_dir.ijm
This macro prompts the user to select a directory containing Nikon Elements ND2 files and regions of interest (ROIs) files. The macro parses the files in the directory in a for loop that requires the only files in that directory to be the ND2 files and the .roi/.zip files **AND** that the .roi/.zip files have the same name as the ND2 files (note the *n+=2* in the for loop). The macro uses the Bio-Formats Importer to open the ND2 files and the ROIs. The macro then loops through the ROIs to duplicate each region. Each duplicated region is then split into separate channels using Stack Slicer and saved as a .tif stack with the basename of the original ND2 with a _GFP or _RFP or _Trans appended at the end of the file. The order of the channels is hard coded into the macro.

The inflexibility of this macro is by design as it was written as the first step of a complex, multi-application tracking pipeline we often give to new lab members and forces a certain file organization. Listen to the prologue of episode [386](https://www.thisamericanlife.org/386/fine-print) of *This American Life* for how  [Van Halen](https://en.wikipedia.org/wiki/Van_Halen "You're Welcome") inspired this rationale.


> Written with [StackEdit](https://stackedit.io/).