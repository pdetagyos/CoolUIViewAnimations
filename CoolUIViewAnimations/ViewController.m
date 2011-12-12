//
//  ViewController.m
//  CoolUIViewAnimations
//
//  Created by Peter de Tagyos on 12/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

// Code examples from:
// http://www.raywenderlich.com/2454/how-to-use-uiview-animation-tutorial
// http://www.raywenderlich.com/5478/uiview-animation-tutorial-practical-recipes
// and my brain!

#import "ViewController.h"

#import "UIView+Animation.h"

@implementation ViewController
@synthesize curlView;
@synthesize haloView;
@synthesize haloImageView;
@synthesize haloInnerImageView;
@synthesize drainView;
@synthesize zoomButton;
@synthesize scaleView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Setup the gesture recognizers for the curl view
    UISwipeGestureRecognizer *curlUpRecognizer = 
    [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(curlViewDisappear)] autorelease];
    [curlUpRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.curlView addGestureRecognizer:curlUpRecognizer];

    UISwipeGestureRecognizer *curlDownRecognizer = 
    [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(curlViewAppear)] autorelease];
    [curlDownRecognizer setDirection:UISwipeGestureRecognizerDirectionDown];
    [[self view] addGestureRecognizer:curlDownRecognizer];
    
    // Setup the gesture recognizer for the halo view
    UITapGestureRecognizer *tapRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(haloViewEffect)] autorelease];
    [tapRecognizer setNumberOfTouchesRequired:1];
    [tapRecognizer setNumberOfTapsRequired:1];
    [self.haloView addGestureRecognizer:tapRecognizer];
    
    // Setup the gesture recognizer for the drain view
    UITapGestureRecognizer *tapRecognizerDrain = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(drainAway)] autorelease];
    [tapRecognizerDrain setNumberOfTouchesRequired:1];
    [tapRecognizerDrain setNumberOfTapsRequired:1];
    [self.drainView addGestureRecognizer:tapRecognizerDrain];

    // Setup the gesture recognizer for the scale view
    UITapGestureRecognizer *tapRecognizerScale = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scaleTransition)] autorelease];
    [tapRecognizerScale setNumberOfTouchesRequired:1];
    [tapRecognizerScale setNumberOfTapsRequired:1];
    [self.scaleView addGestureRecognizer:tapRecognizerScale];

}

- (void)viewDidUnload
{
    [self setCurlView:nil];
    [self setHaloView:nil];
    [self setHaloImageView:nil];
    [self setHaloInnerImageView:nil];
    [self setDrainView:nil];
    [self setZoomButton:nil];
    [self setScaleView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [curlView release];
    [haloView release];
    [haloImageView release];
    [haloInnerImageView release];
    [drainView release];
    [zoomButton release];
    [scaleView release];
    [super dealloc];
}

- (void)curlViewAppear {
    [self.curlView curlDown:0.5];
}

- (void)curlViewDisappear {
    [self.curlView curlUpAndAway:0.5];
}

- (void)haloViewEffect {
    self.haloImageView.alpha = 1.0;
    [self.haloImageView spinClockwise:5.0];
    [self.haloImageView pulse:2.0 continuously:YES];
    self.haloInnerImageView.alpha = 1.0;
    [self.haloInnerImageView spinCounterClockwise:3.0];
}

- (void)drainAway {
    [self.drainView drainAway:3];
}

- (IBAction)zoomOut:(id)sender {
    [self.zoomButton raceTo:CGPointMake(-133, 243) withSnapBack:NO];    
}

- (IBAction)zoomIn:(id)sender {
    [self.zoomButton raceTo:CGPointMake(177, 243) withSnapBack:YES];
}

- (void)scaleTransition {
    [self.scaleView moveTo:CGPointMake(100, 100) duration:1.0 option:UIViewAnimationCurveEaseInOut delegate:self callback:@selector(transitionCompleted)];
    [self.scaleView scale:1.0 x:1.5 y:1.5 delegate:nil callback:nil];
}

- (void)transitionCompleted {
    NSLog(@"DONE!");
}

@end
