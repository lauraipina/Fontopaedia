//
//  LIPFontViewController.h
//  Fontopaedia
//
//  Created by Laura Iglesias Piña on 28/1/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LIPFontViewController : UIViewController

@property (strong, nonatomic) UIFont *font;

@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;

@property (weak, nonatomic) IBOutlet UITextView *txtLabel;


-(id)initWithFont:(UIFont *)font;

@end
