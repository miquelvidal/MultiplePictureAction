//
//  VistaMail.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MkAccioMail.h"

#import "MkTransporter.h"

#import "VistaEntrada.h"

@interface VistaMail : UIViewController

@property(nonatomic) IBOutlet UIStepper* unStepper;
@property(nonatomic) IBOutlet UILabel* msgNumMails;
@property(nonatomic) IBOutlet UISwitch* zipCompression;

-(IBAction)modificatStepper:(id)sender;
-(IBAction)sendByMail:(id)sender;

@end
