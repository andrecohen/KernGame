//
//  ViewController.m
//  KernGame
//
//  Created by Andre Cohen on 12/14/14.
//  Copyright (c) 2014 White Shoe Media. All rights reserved.
//

#import "ViewController.h"
#import "Letter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	paper = [[Paper alloc] initWithFont:[UIFont fontWithName:@"Gill Sans" size:82] text:@"The quick brown fox jumps over the lazy dog"];

	scroll = [[UIScrollView alloc] init];
	[scroll setFrame:self.view.frame];
	[scroll setScrollEnabled:YES];
	[scroll setContentSize:paper.frame.size];
	[scroll setDelegate:self];
	[scroll setMaximumZoomScale:1];
	[scroll setMinimumZoomScale:.5];
	[scroll setZoomScale:.5 animated:YES];
	[scroll addSubview:paper];
	[self.view addSubview:scroll];
	
	self.view.userInteractionEnabled = YES;
	paper.userInteractionEnabled = YES;
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}




- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return paper;
}


@end
