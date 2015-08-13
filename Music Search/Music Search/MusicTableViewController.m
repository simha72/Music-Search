//
//  MusicTableViewController.m
//  Music Search
//
//  Created by Nuvvala on 8/12/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import "MusicTableViewController.h"
#import "MusicData.h"
#import "MusicTableViewCell.h"
#import "MyMusic.h"
#import "LyricsViewController.h"

@interface MusicTableViewController ()


@property(nonatomic,strong) MusicData *dataRequest;


@end

@implementation MusicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestJSONFromUrl:@"https://itunes.apple.com/search?term=tom"];
}

-(void)requestJSONFromUrl:(NSString *)urlString
{
    self.dataRequest = [[MusicData alloc]init];
    
    [self.dataRequest getStreamsFromURLString:urlString success:^(NSArray *musicArray) {
        
        self.musicItems = musicArray;
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Error in Loading booksArraay" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
     return self.musicItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     MusicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    if (cell == 0) {
        cell = [[MusicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    
    MyMusic *audio = self.musicItems[indexPath.row];

    // Configure the cell...
    
    cell.trackName.text = audio.track;
    cell.artistName.text = audio.artist;
    cell.albumName.text = audio.album;
    cell.albumImage.image = audio.icon;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:@"musicDataSegua" sender:indexPath];
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"musicDataSegua"]) {
        
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        MyMusic *musicc = self.musicItems[indexPath.row];
        

        
        LyricsViewController *destinationController = (LyricsViewController *)segue.destinationViewController;
        
        destinationController.name = musicc.track;
        destinationController.artist = musicc.artist;
        destinationController.album = musicc.album;
        destinationController.image = musicc.icon;
    }
    
}


@end
