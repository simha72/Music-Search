//
//  LyricsViewController.h
//  Music Search
//
//  Created by Nuvvala on 8/12/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LyricsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *albumImage;

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *artist;
@property(nonatomic,strong) NSString *album;
@property(nonatomic,strong) UIImage *image;

@property (weak, nonatomic) IBOutlet UILabel *lbname;

@property (weak, nonatomic) IBOutlet UILabel *lbArtist;

@property (weak, nonatomic) IBOutlet UILabel *lbAlbum;

@property (weak, nonatomic) IBOutlet UILabel *lbLyric;

@end
