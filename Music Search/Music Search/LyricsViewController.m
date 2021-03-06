//
//  LyricsViewController.m
//  Music Search
//
//  Created by Nuvvala on 8/12/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import "LyricsViewController.h"
#import "LyricsData.h"
#import "MyMusic.h"

@interface LyricsViewController ()
@property(nonatomic,strong) LyricsData *dataRequest;

@end

@implementation LyricsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lbname.text = self.name;
    self.lbArtist.text = self.artist;
    self.lbAlbum.text = self.album;
    self.albumImage.image = self.image;
    
    self.dataRequest = [[LyricsData alloc]init];
    
    
    NSString *url = [NSString stringWithFormat:@"http://lyrics.wikia.com/api.php?action=lyrics&artist=%@&song=%@&fmt=xml", self.artist,self.name];

 url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self requestJSONFromUrl:url];
    
 //   MyMusic *music = [MyMusic alloc]initWithLyrics:
    
   //  _lbLyric.text =music;
}

-(void)requestJSONFromUrl:(NSString *)urlString
{
    
    
    [self.dataRequest getStreamsFromURLString:urlString success:^(NSString *musicArray) {
        
     //  self.musicItem = musicArray;
        
        
        NSString *str = musicArray;
        
        
        _lbLyric.text = str;
        
    } failure:^(NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Error in Loading Lyricks" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
