//
//  MusicData.m
//  Music Search
//
//  Created by Nuvvala on 8/12/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import "MusicData.h"
#import "MyMusic.h"


@implementation MusicData

-(void)getStreamsFromURLString:(NSString *)urlString success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:requestUrl];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *finalDict = (NSDictionary *)responseObject;
        
        NSArray *array = finalDict[@"results"];
        
        NSMutableArray *musicArray = [[NSMutableArray alloc]init];
               for (NSDictionary *dict in array) {
        NSString *name = dict[@"trackName"];
        NSString *artist = dict[@"artistName"];
         NSString *author = dict[@"collectionName"];
        NSString *imageUrl = dict[@"artworkUrl100"];
        
        
        
        MyMusic *music = [[MyMusic alloc]initWithTrack:name artist:artist album:author imageURL:imageUrl];
        
        [musicArray addObject:music];
        
               }
         success(musicArray);
     }
     
        
        
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@" %@ ",error);
        failure(error);
    }];
        [operation start];

}
    
@end
