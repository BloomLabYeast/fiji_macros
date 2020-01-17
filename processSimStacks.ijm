run("Image Sequence...", "open=C:/Users/lawrimor/Desktop/bottleBrushSims/varyLength/Seed7/Brownian_to_fluorosim/bottlebrush_n100_L10_s7_um_tif/bottlebrush_n100_L10_s7_um_1_0000_G_1.tif sort");
run("Stack to Hyperstack...", "order=xyczt(default) channels=1 slices=7 frames=38 display=Grayscale");
run("Z Project...", "projection=[Max Intensity] all");
//setTool("rectangle");
makeRectangle(37, 27, 41, 43);
run("Duplicate...", "duplicate");
saveAs("Tiff", "C:/Users/lawrimor/Desktop/bottleBrushSims/varyLength/Seed7/Brownian_to_fluorosim/bottlebrush_n100_L10_s7_um_tif/MAX_bottlebrush_n100_L10_s7_um_tif-1.tif");
