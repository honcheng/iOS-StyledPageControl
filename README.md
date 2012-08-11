Customizable PageControl for iOS
=============

<img src="https://github.com/honcheng/iOS-StyledPageControl/raw/master/screenshot.png"/>

StyledPageControl is a customizable replacement for UIPageControl for iOS. 

Features
--------
* 5 Styles
* change colors
* change diameter
* change gap width
* change stroke width
* show current page number
* use custom images

Usage
-----

1) Drag StyledPageControl.h and StyledPageControl.m into your project. 

    #import StyledPageControl.h

2) Create StyledPageControl just like a UIPageControl

    StyledPageControl *pageControl = [[StyledPageControl alloc] init];
	[self addSubview:pageControl];
	
3) Set page control style

	[pageControl setPageControlStyle:PageControlStyleDefault]; 
	
4) Set number of pages

	[pageControl setNumberOfPages:10];
	
5) Set current page

	[pageControl setCurrentPage:5];
	
6) Change page control colors
	
    [pageControl setCoreNormalColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
    [pageControl setCoreSelectedColor:[UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:1]];
	
7) Change distance between dots
	
	[pageControl setGapWidth:5];
	
8) Change dot's diameter
	
	[pageControl setDiameter:9];
	
9) Use custom thumbnails
	
    [pageControl setPageControlStyle:PageControlStyleThumb];
    [pageControl setThumbImage:[UIImage imageNamed:@"pagecontrol-thumb-normal.png"]];
    [pageControl setSelectedThumbImage:[UIImage imageNamed:@"pagecontrol-thumb-selected.png"]];
	

Minimum Requirements
--------------------
* ARC - this project uses ARC. If you are not using ARC in your project, add '-fobjc-arc' as a compiler flag for StyledPageControl.h and StyledPageControl.m
* XCode 4.4 and newer (auto-synthesis required)

Contact
-------

[twitter.com/honcheng](http://twitter.com/honcheng)  
[honcheng.com](http://honcheng.com)

