//
//  VistaEntrada.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MkAccio.h"

#import "MkTransporter.h"
#import "MkAlbumLoader.h"
#import "MkDbFetcher.h"

@interface VistaEntrada : UIViewController <UIAlertViewDelegate>

@property(nonatomic) IBOutlet UILabel* txtImatges;
@property(nonatomic) IBOutlet UILabel* txtAccio;
@property(nonatomic) IBOutlet UILabel* txtLog;

@property(nonatomic) IBOutlet UIImageView* okStep1;
@property(nonatomic) IBOutlet UILabel* txtStep1;
@property(nonatomic) IBOutlet UIButton* botoStep1;


@property(nonatomic) IBOutlet UIImageView* okStep2;
@property(nonatomic) IBOutlet UILabel* txtStep2;
@property(nonatomic) IBOutlet UIButton* botoStep2;


@property(nonatomic) IBOutlet UIImageView* okStep3;
@property(nonatomic) IBOutlet UILabel* txtStep3;
@property(nonatomic) IBOutlet UIButton* botoStep3;

@property(nonatomic) IBOutlet UIActivityIndicatorView* temps;

@property(nonatomic) IBOutlet UIBarButtonItem* reset;

@property(nonatomic) Boolean okReset;

-(IBAction)accioApply:(id)sender;
-(void)step0;
-(void)step1Done;
-(void)step2Done;
-(void)step3Done;
-(IBAction)resetejar:(id)sender;

// per l'alert
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;

@end
