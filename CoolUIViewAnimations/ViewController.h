//
//  ViewController.h
//  CoolUIViewAnimations
//
//  Created by Peter de Tagyos on 12/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIView *curlView;
@property (retain, nonatomic) IBOutlet UIView *haloView;
@property (retain, nonatomic) IBOutlet UIImageView *haloImageView;
@property (retain, nonatomic) IBOutlet UIImageView *haloInnerImageView;
@property (retain, nonatomic) IBOutlet UIView *drainView;
@property (retain, nonatomic) IBOutlet UIButton *zoomButton;

- (IBAction)zoomIn:(id)sender;
- (IBAction)zoomOut:(id)sender;
@end
