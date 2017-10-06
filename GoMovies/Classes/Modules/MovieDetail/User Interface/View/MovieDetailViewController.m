//
//  MovieDetailViewController.m
//  GoMovies
//
//  Created by Hassan on 10/06/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "ColorPalette.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>
#import "NSString+RemoveHtmlTags.h"
#import "MovieInfoCell.h"

@implementation MovieDetailViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSegment];
    [self setupViews];
    [self setupTableView];
}

- (void)initSegment
{
    self.segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    self.segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentControl.selectionIndicatorColor = ColorPalette.IndicatorColor;
    self.segmentControl.backgroundColor = ColorPalette.MovieCellBackgroundColor;
    
    self.segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor grayColor],
                                                NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Light" size:20.0]
                                                };
    self.segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor],
                                                        NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Light" size:20.0]
                                                        };

    [self.segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    
    NSArray *titlesArr = [NSArray arrayWithObjects:@"Info", @"Trailer", @"Comments", @"Awards", @"Review", nil];
    [self.segmentControl setSectionTitles:titlesArr];
    [self.segmentControl setSelectedSegmentIndex:0];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
{
}

- (void)setupTableView {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.backgroundColor = ColorPalette.MovieCellBackgroundColor;
    
//    self.tableView.rowHeight = 200;
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieInfoCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"movieInfoCell"];
}

- (void) setupViews {

    self.title = @"GoMovies";

    self.view.backgroundColor = ColorPalette.MovieCellBackgroundColor;
    
    self.movieTitleLabel.text = self.movie.name;
    self.movieGenreLabel.text = [self.movie.genres componentsJoinedByString:@", "];
    
    self.imdbBadge.layer.cornerRadius = 10;
    self.imdbBadge.clipsToBounds = true;
    
    self.movieImageView.layer.cornerRadius = 5;
    self.movieImageView.clipsToBounds = true;

    [self.movieImageView sd_setShowActivityIndicatorView:YES];
    [self.movieImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.movieImageView sd_setImageWithURL:[NSURL URLWithString: self.movie.image.medium] placeholderImage:[UIImage imageNamed:@"MoviePlaceHolder"] options:SDWebImageRetryFailed];

    [self.headerImageView sd_setShowActivityIndicatorView:YES];
    [self.headerImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString: self.movie.image.medium] placeholderImage:[UIImage imageNamed:@"MoviePlaceHolder"] options:SDWebImageRetryFailed];

}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"movieInfoCell";
    MovieInfoCell *cell = (MovieInfoCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Story: " attributes:@{NSForegroundColorAttributeName: UIColor.grayColor, NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:14]}];
    
    [string appendAttributedString:[[NSAttributedString alloc] initWithString:[self.movie.summary stringByStrippingHTML] attributes:@{NSForegroundColorAttributeName: UIColor.blackColor, NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:14]}] ];
    
    cell.movieInfoLabel.attributedText = string;
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellheight = 40;
    
    NSString *text = [self.movie.summary stringByStrippingHTML];
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:14];// The font should be the same as that of your textView
    CGSize constraintSize = CGSizeMake(self.tableView.frame.size.width, CGFLOAT_MAX);// maxWidth = max width for the textView
    
//    CGSize size = [text bound]
    
    CGSize size = [text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    cellheight += size.height;
    
    return cellheight;
}

@end



