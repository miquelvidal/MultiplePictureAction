//
//  VistaFiltres.m
//  MultiPicAction
//
//  Created by Miquel Isidre Vidal Carretero on 1/18/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "VistaFiltres.h"

@interface VistaFiltres ()

@end

@implementation VistaFiltres

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/// Funcions de la class

+(GPUImageOutput*)filtrePerNum:(NSInteger) index{
    GPUImageOutput *selectedFilter;
    switch (index) {
        case 0:
            selectedFilter = [[GPUImageGrayscaleFilter alloc] init];
            break;
        case 1:
            selectedFilter = [[GPUImageSepiaFilter alloc] init];
            break;
        case 2:
            selectedFilter = [[GPUImageSketchFilter alloc] init];
            break;
        case 3:
            selectedFilter = [[GPUImagePixellateFilter alloc] init];
            break;
        case 4:
            selectedFilter = [[GPUImageColorInvertFilter alloc] init];
            break;
        case 5:
            selectedFilter = [[GPUImageToonFilter alloc] init];
            break;
        case 6:
            selectedFilter = [[GPUImagePinchDistortionFilter alloc] init];
            break;
        case 7:
            selectedFilter = [[GPUImageBrightnessFilter alloc] init];
            break;
        case 8:
            selectedFilter = [[GPUImageExposureFilter alloc] init];
            break;
        case 9:
            selectedFilter = [[GPUImageContrastFilter alloc] init];
            break;
        case 10:
            selectedFilter = [[GPUImageSaturationFilter alloc] init];
            break;
        case 11:
            selectedFilter = [[GPUImageGammaFilter alloc] init];
            break;
        case 12:
            selectedFilter = [[GPUImageColorMatrixFilter alloc] init];
            break;
        case 13:
            selectedFilter = [[GPUImageRGBFilter alloc] init];
            break;
        case 14:
            selectedFilter = [[GPUImageHueFilter alloc] init];
            break;
        case 15:
            selectedFilter = [[GPUImageToneCurveFilter alloc] init];
            break;
        case 16:
            selectedFilter = [[GPUImageHighlightShadowFilter alloc] init];
            break;
        case 17:
            selectedFilter = [[GPUImageAmatorkaFilter alloc] init];
            break;
        case 18:
            selectedFilter = [[GPUImageMissEtikateFilter alloc] init];
            break;
        case 19:
            selectedFilter = [[GPUImageSoftEleganceFilter alloc] init];
            break;
        case 20:
            selectedFilter = [[GPUImageMonochromeFilter alloc] init];
            break;
        case 21:
            selectedFilter = [[GPUImageAverageLuminanceThresholdFilter alloc] init];
            break;
#pragma  warning
        case 22:
            
            selectedFilter = [[GPUImageFilter alloc] init];
//            selectedFilter = [[GPUImageLuminosity alloc] init];
            break;
        case 23:
            selectedFilter = [[GPUImageChromaKeyFilter alloc] init];
            break;
        case 24:
            selectedFilter = [[GPUImagePolarPixellateFilter alloc] init];
            break;
        case 25:
            selectedFilter = [[GPUImagePolkaDotFilter alloc] init];
            break;
        case 26:
            selectedFilter = [[GPUImageHalftoneFilter alloc] init];
            break;
        case 27:
            selectedFilter = [[GPUImageCrosshatchFilter alloc] init];
            break;
        case 28:
            selectedFilter = [[GPUImageSmoothToonFilter alloc] init];
            break;
        case 29:
            selectedFilter = [[GPUImageEmbossFilter alloc] init];
            break;
        case 30:
            selectedFilter = [[GPUImagePosterizeFilter alloc] init];
            break;
        case 31:
            selectedFilter = [[GPUImageSwirlFilter alloc] init];
            break;
        case 32:
            selectedFilter = [[GPUImageBulgeDistortionFilter alloc] init];
            break;
        case 33:
            selectedFilter = [[GPUImageStretchDistortionFilter alloc] init];
            break;
        case 34:
            selectedFilter = [[GPUImageVignetteFilter alloc] init];
            break;
        case 35:
            selectedFilter = [[GPUImageKuwaharaFilter alloc] init];
            break;
        default:
            //en el cas de seleccionar unfiltre que no existeix tornem el buit
            selectedFilter = [[GPUImageFilter alloc] init];
            break;
            
    }
    return selectedFilter;
}
+(NSString*)txtFiltre:(NSInteger)index{
    /*
    NSString* txtSeleccionat;
    switch (index) {
        case 0:
            txtSeleccionat = [NSString stringWithFormat:@"0"];
            break;
        case 1:
            txtSeleccionat = [NSString stringWithFormat:@"1"];
            break;
        case 2:
            txtSeleccionat = [NSString stringWithFormat:@"2"];
            break;
        case 3:
            txtSeleccionat = [NSString stringWithFormat:@"3"];
            break;
        case 4:
            txtSeleccionat = [NSString stringWithFormat:@"4"];
            break;
        case 5:
            txtSeleccionat = [NSString stringWithFormat:@"5"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"6"];
            break;
        case 7:
            txtSeleccionat = [NSString stringWithFormat:@"7"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"8"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"9"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"10"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"11"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"12"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"13"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"9"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"9"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"9"];
            break;
        case 6:
            txtSeleccionat = [NSString stringWithFormat:@"9"];
            break;
        default:
            txtSeleccionat = [NSString stringWithFormat:@""];
            break;

    }*/
    //return txtSeleccionat;

    return [NSString stringWithFormat:@"%i",index];
}

+(NSInteger)numFiltres{
    return 35;
};


-(IBAction)seleccionatFiltre:(id)sender{
    UIButton* unBoto = sender;
    NSInteger indexFiltre = unBoto.tag; 
    /// s'ha de crear l'acció amb el filtre seleccionat i el text per informar l'usuari.
}

//////Funcions de Vista Collecció
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    //return [sectionInfo numberOfObjects];
    return [VistaFiltres numFiltres];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@" cella %i",indexPath.item);
    //treiem la cella (no sé d'on)
    VistaCellaFiltres *cell = (VistaCellaFiltres*) [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier  forIndexPath:indexPath];
    cell.unFiltre = [VistaFiltres filtrePerNum:indexPath.item];
    cell.unBoto.titleLabel.text = [VistaFiltres txtFiltre:indexPath.item];
    NSArray* imatgesSeleccionades = [MkDbFetcher imatgesSeleccionadesMesAlbum:[MkTransporter getObjectFromNSString:@"managedObjectContext"]];
    if (imatgesSeleccionades) {
        if (imatgesSeleccionades.count>0) {
            MkDbImg* dbImage = [imatgesSeleccionades objectAtIndex:0];
            cell.unaImageView.image = [cell.unFiltre imageByFilteringImage:dbImage.thumbnail.imatge];
        }
    }
    //Posem totes les variables a la cel·la
    //retornem la cella
    return cell;
}

@end
