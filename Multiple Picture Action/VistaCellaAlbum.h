//
//  VistaCellaAlbum.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/3/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MkDbAlbum.h"
#import "MkDbAlbumThumbnail.h"

#import "MkTransporter.h"

@interface VistaCellaAlbum : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView* unaImageView;
@property (weak, nonatomic) IBOutlet UISwitch* totes;
@property (weak, nonatomic) IBOutlet UILabel* titol;
@property (weak, nonatomic) IBOutlet UILabel* quantes;
@property (weak, nonatomic) IBOutlet UIButton* unButo;
@property (weak, nonatomic) UICollectionViewController* controller;
@property (weak,nonatomic) MkDbAlbum* unAlbum;

- (IBAction)veureAlbum:(id)sender;
- (IBAction)seleccionarTotes:(id)sender;

-(void)actualitzar;

@end
