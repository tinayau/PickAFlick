//
//  XYZViewController.m
//  tizzyMovie
//
//  Created by tiffanyyau on 5/7/14.
//  Copyright (c) 2014 Tizzy. All rights reserved.
//

#import "XYZViewController.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define filmRecURL [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/movies/12873/similar.json?limit=5&apikey=[ENTER YOUR KEY HERE]"] //2
#define boxOfficeURL [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=16&country=us&apikey=[ENTER YOUR KEY HERE]"]
#define dvdRentalURL [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?limit=10&country=us&apikey=[ENTER YOUR KEY HERE]"]


@interface XYZViewController ()

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    dispatch_async(kBgQueue, ^{NSData* data = [NSData dataWithContentsOfURL: filmRecURL];
        [self performSelectorOnMainThread:@selector(similarFilmData:) withObject:data waitUntilDone:YES];});
    
    dispatch_async(kBgQueue, ^{NSData* data = [NSData dataWithContentsOfURL: boxOfficeURL];
        [self performSelectorOnMainThread:@selector(boxOfficeData:) withObject:data waitUntilDone:YES];});
    
    dispatch_async(kBgQueue, ^{NSData* data = [NSData dataWithContentsOfURL: dvdRentalURL];
        [self performSelectorOnMainThread:@selector(dvdRentalData:) withObject:data waitUntilDone:YES];});
    
}



- (void)similarFilmData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* similarFilm = [json objectForKey:@"movies"];
    
    NSLog(@"movies: %@", similarFilm);
    
    
    NSDictionary* film = [similarFilm objectAtIndex:0];
    // 3) Set the label appropriately
    rec1.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                    [film objectForKey:@"title"],
                    [film objectForKey:@"year"],
                    [film objectForKey:@"mpaa_rating"],
                    [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"critics_score"],
                    [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec1data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    poster1.image = [[UIImage alloc] initWithData:rec1data];
    
    NSDictionary* film2 = [similarFilm objectAtIndex:1];
    // 3) Set the label appropriately
    rec2.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film2 objectForKey:@"title"],
                 [film2 objectForKey:@"year"],
                 [film2 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film2 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film2 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec2data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film2 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    poster2.image = [[UIImage alloc] initWithData:rec2data];
    
    NSDictionary* film3 = [similarFilm objectAtIndex:2];
    // 3) Set the label appropriately
    rec3.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film3 objectForKey:@"title"],
                 [film3 objectForKey:@"year"],
                 [film3 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film3 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film3 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec3data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film3 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    poster3.image = [[UIImage alloc] initWithData:rec3data];
    
    NSDictionary* film4 = [similarFilm objectAtIndex:3];
    // 3) Set the label appropriately
    rec4.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film4 objectForKey:@"title"],
                 [film4 objectForKey:@"year"],
                 [film4 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film4 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film4 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec4data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film4 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    poster4.image = [[UIImage alloc] initWithData:rec4data];
    
    NSDictionary* film5 = [similarFilm objectAtIndex:4];
    // 3) Set the label appropriately
    rec5.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film5 objectForKey:@"title"],
                 [film5 objectForKey:@"year"],
                 [film5 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film5 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film5 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec5data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film5 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    poster5.image = [[UIImage alloc] initWithData:rec5data];
    
    
}





- (void)boxOfficeData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* topBoxOffice = [json objectForKey:@"movies"];
    
    NSLog(@"movies: %@", topBoxOffice);
    
    
    NSDictionary* film = [topBoxOffice objectAtIndex:0];
    // 3) Set the label appropriately
    box1.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film objectForKey:@"title"],
                 [film objectForKey:@"year"],
                 [film objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    fav4.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film objectForKey:@"title"],
                 [film objectForKey:@"year"],
                 [film objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec1data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Bposter1.image = [[UIImage alloc] initWithData:rec1data];
    Fposter4.image = [[UIImage alloc] initWithData:rec1data];
    
    NSDictionary* film2 = [topBoxOffice objectAtIndex:1];
    // 3) Set the label appropriately
    box2.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film2 objectForKey:@"title"],
                 [film2 objectForKey:@"year"],
                 [film2 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film2 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film2 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec2data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film2 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Bposter2.image = [[UIImage alloc] initWithData:rec2data];
    
    NSDictionary* film3 = [topBoxOffice objectAtIndex:2];
    // 3) Set the label appropriately
    box3.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film3 objectForKey:@"title"],
                 [film3 objectForKey:@"year"],
                 [film3 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film3 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film3 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    fav5.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film3 objectForKey:@"title"],
                 [film3 objectForKey:@"year"],
                 [film3 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film3 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film3 objectForKey:@"ratings"] objectForKey:@"audience_score"]];

    
    NSData *rec3data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film3 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Bposter3.image = [[UIImage alloc] initWithData:rec3data];
    Fposter5.image = [[UIImage alloc] initWithData:rec3data];
    
    NSDictionary* film4 = [topBoxOffice objectAtIndex:3];
    // 3) Set the label appropriately
    box4.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film4 objectForKey:@"title"],
                 [film4 objectForKey:@"year"],
                 [film4 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film4 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film4 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec4data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film4 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Bposter4.image = [[UIImage alloc] initWithData:rec4data];
    
    NSDictionary* film5 = [topBoxOffice objectAtIndex:4];
    // 3) Set the label appropriately
    box5.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film5 objectForKey:@"title"],
                 [film5 objectForKey:@"year"],
                 [film5 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film5 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film5 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec5data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film5 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Bposter5.image = [[UIImage alloc] initWithData:rec5data];
    
    
}





- (void)dvdRentalData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* topDVDrental = [json objectForKey:@"movies"];
    
    NSLog(@"movies: %@", topDVDrental);
    
    
    NSDictionary* film = [topDVDrental objectAtIndex:0];
    // 3) Set the label appropriately
    dvd1.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film objectForKey:@"title"],
                 [film objectForKey:@"year"],
                 [film objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    fav1.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film objectForKey:@"title"],
                 [film objectForKey:@"year"],
                 [film objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec1data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Dposter1.image = [[UIImage alloc] initWithData:rec1data];
    Fposter1.image = [[UIImage alloc] initWithData:rec1data];
    
    NSDictionary* film2 = [topDVDrental objectAtIndex:1];
    // 3) Set the label appropriately
    dvd2.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film2 objectForKey:@"title"],
                 [film2 objectForKey:@"year"],
                 [film2 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film2 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film2 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    fav2.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film2 objectForKey:@"title"],
                 [film2 objectForKey:@"year"],
                 [film2 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film2 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film2 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec2data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film2 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Dposter2.image = [[UIImage alloc] initWithData:rec2data];
    Fposter2.image = [[UIImage alloc] initWithData:rec2data];
    
    NSDictionary* film3 = [topDVDrental objectAtIndex:2];
    // 3) Set the label appropriately
    dvd3.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film3 objectForKey:@"title"],
                 [film3 objectForKey:@"year"],
                 [film3 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film3 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film3 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    
    NSData *rec3data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film3 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Dposter3.image = [[UIImage alloc] initWithData:rec3data];
    
    NSDictionary* film4 = [topDVDrental objectAtIndex:3];
    // 3) Set the label appropriately
    dvd4.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film4 objectForKey:@"title"],
                 [film4 objectForKey:@"year"],
                 [film4 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film4 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film4 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    fav3.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film4 objectForKey:@"title"],
                 [film4 objectForKey:@"year"],
                 [film4 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film4 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film4 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    NSData *rec4data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film4 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Dposter4.image = [[UIImage alloc] initWithData:rec4data];
    Fposter3.image = [[UIImage alloc] initWithData:rec4data];
    
    NSDictionary* film5 = [topDVDrental objectAtIndex:4];
    // 3) Set the label appropriately
    dvd5.text = [NSString stringWithFormat:@"%@ (%@) \nrated %@ \ncritics: %@%%   audiences: %@%%",
                 [film5 objectForKey:@"title"],
                 [film5 objectForKey:@"year"],
                 [film5 objectForKey:@"mpaa_rating"],
                 [(NSDictionary*)[film5 objectForKey:@"ratings"] objectForKey:@"critics_score"],
                 [(NSDictionary*)[film5 objectForKey:@"ratings"] objectForKey:@"audience_score"]];
    
    
    NSData *rec5data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[(NSDictionary*)[film5 objectForKey:@"posters"] objectForKey:@"detailed"]] options:NSDataReadingMapped error:nil];
    
    Dposter5.image = [[UIImage alloc] initWithData:rec5data];
    
    
    
    
}












- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
