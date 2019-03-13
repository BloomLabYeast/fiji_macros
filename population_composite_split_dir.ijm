dir1 = getDirectory("Choose Source Directory ");
list = getFileList(dir1);
for (n=0; n<list.length; n+=2) {
     run("Bio-Formats Importer", "open="+dir1+list[n]+" autoscale color_mode=Grayscale concatenate_series open_all_series rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
     name = File.nameWithoutExtension;
     nameext = File.name;
     print(n);
     roiManager("Open",dir1+list[n+1]);

//Get the name of the open image
filename = getInfo("image.filename");
//remove the file extension
name_array = split(filename,".");
basename = name_array[0];
//Get the directory of the open image
file_dir = getInfo("image.directory");
//Get the number of objects in the ROI Manager
count = roiManager("count");
//Loop through the ROIs in the ROI Manager
for (i=0; i<count; i++) {
	j = i+1;
	roiManager("Select", i);
	Stack.getPosition(channel, slice, frame);
	run("Duplicate...", "title=Cell duplicate frames=frame");
	run("Stack Slicer", "split_channels stack_order=XYCTZ");
	if (i<10) {
		string = "Cell_00";
	} else {
		string = "Cell_0";
	}
	selectWindow("Cell - C=1");
	saveAs("Tiff", file_dir+string+j+"_"+basename+"_GFP");
	close(string+j+"_"+basename+"_GFP"+".tif");
	selectWindow("Cell - C=0");
	saveAs("Tiff", file_dir+string+j+"_"+basename+"_RFP");
	close(string+j+"_"+basename+"_RFP"+".tif");
}
// delete roi's before loading in more
roiManager("reset");
title = getTitle();
close(title);
}
