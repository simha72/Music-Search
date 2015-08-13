//
//  MyMusic.h
//  Music Search
//
//  Created by Nuvvala on 8/12/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MyMusic : NSObject


@property(nonatomic,strong) NSString *track;
@property(nonatomic,strong) NSString *artist;
@property(nonatomic,strong) NSString *album;
@property(nonatomic,strong) NSString *imageURL;
@property(nonatomic,strong) UIImage  *icon;

@property(nonatomic,strong) NSString *lyrics;

-(instancetype)initWithTrack:(NSString *)track artist:(NSString *)artist album:(NSString *)album imageURL:(NSString *)imageURL;

-(instancetype)initWithLyrics:(NSString *)lyric;

@end
