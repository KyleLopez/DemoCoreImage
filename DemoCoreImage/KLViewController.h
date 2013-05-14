//
//  KLViewController.h
//  DemoCoreImage
//
//  Created by Kyle Lopez on 5/13/13.
//  Copyright (c) 2013 Kyle Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLViewController : UIViewController
- (IBAction)blurSun:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *sunImage;

@end
