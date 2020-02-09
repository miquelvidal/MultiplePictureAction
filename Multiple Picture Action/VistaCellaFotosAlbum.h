//
//  VistaCellaFotosAlbum.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MkDbAlbum.h"
#import "MkDbAlbumThumbnail.h"
#import "MkDbImg.h"
#import "MkDbImgThumbnail.h"

@interface VistaCellaFotosAlbum : UICollectionViewCell

@property(nonatomic) IBOutlet UIButton* botoAfegir;
@property(nonatomic) IBOutlet UIButton* botoTreure;
@property(nonatomic) IBOutlet UIImageView* unaImageView;
@property(nonatomic) MkDbImg* unaImatge;

-(void)actualitzaDades;
-(IBAction)seleccionadaFoto:(id)sender;
-(IBAction)deseleccionarFoto:(id)sender;

@end
