//Get image
path = File.openDialog("Select the Max Merged Hyperstack");
open(path);
//Get roi's
roiPath = File.openDialog("Select the ROIs");
open(roiPath);
//Get directory
imageDir = getDirectory("image");
print(imageDir);
//Make new cell directory
newDir = imageDir + "cell" + File.separator;
File.makeDirectory(newDir);
print(newDir);
//Get image title
title = getTitle();
//Get the number of objects in the ROI Manager
count = roiManager("count");
//Loop through the ROIs in the ROI Manager
for (i=0; i<count; i++) {
	roiManager("Select", i);
	run("Duplicate...", "i");
	title = getTitle();
	save(newDir+i);
	close(title);
	//Stack.setFrame(n); 
}