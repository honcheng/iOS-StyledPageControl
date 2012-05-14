//
//  PageControl.m
//  PageControlDemo
//
/**
 * Created by honcheng on 5/14/11.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining 
 * a copy of this software and associated documentation files (the 
 * "Software"), to deal in the Software without restriction, including 
 * without limitation the rights to use, copy, modify, merge, publish, 
 * distribute, sublicense, and/or sell copies of the Software, and to 
 * permit persons to whom the Software is furnished to do so, subject 
 * to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be 
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT 
 * WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR 
 * PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
 * SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
 * IN CONNECTION WITH THE SOFTWARE OR 
 * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * @author 		Muh Hon Cheng <honcheng@gmail.com> http://twitter.com/honcheng
 * @copyright	2011	Muh Hon Cheng
 * 
 */

#import "StyledPageControl.h"


@implementation StyledPageControl
@synthesize currentPage = _currentPage;
@synthesize numberOfPages = _numberOfPages;
@synthesize hidesForSinglePage = _hidesForSinglePage;
@synthesize coreNormalColor = _coreNormalColor;
@synthesize coreSelectedColor = _coreSelectedColor;
@synthesize strokeNormalColor = _strokeNormalColor;
@synthesize strokeSelectedColor = _strokeSelectedColor;
@synthesize pageControlStyle = _pageControlStyle;
@synthesize strokeWidth = _strokeWidth;
@synthesize diameter = _diameter;
@synthesize gapWidth = _gapWidth;
@synthesize thumbImage = _thumbImage;
@synthesize selectedThumbImage = _selectedThumbImage;

#define COLOR_GRAYISHBLUE [UIColor colorWithRed:128/255.0 green:130/255.0 blue:133/255.0 alpha:1]
#define COLOR_GRAY [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1]

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        
        _strokeWidth = 2;
        _gapWidth = 10;
        _diameter = 12;
        _pageControlStyle = PageControlStyleDefault;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapped:)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

- (void)onTapped:(UITapGestureRecognizer*)gesture
{
    CGPoint touchPoint = [gesture locationInView:[gesture view]];
    
    if (touchPoint.x < self.frame.size.width/2)
    {
        // move left
        if (_currentPage>0)
        {
            _currentPage -= 1;
        }
        
    }
    else
    {
        // move right
        if (_currentPage<_numberOfPages-1)
        {
            _currentPage += 1;
        }
    }
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)drawRect:(CGRect)rect
{
    UIColor *coreNormalColor, *coreSelectedColor, *strokeNormalColor, *strokeSelectedColor;
    
    if (_coreNormalColor) coreNormalColor = _coreNormalColor;
    else coreNormalColor = COLOR_GRAYISHBLUE;
    
    if (_coreSelectedColor) coreSelectedColor = _coreSelectedColor;
    else
    {
        if (_pageControlStyle==PageControlStyleStrokedCircle || _pageControlStyle==PageControlStyleWithPageNumber)
        {
            coreSelectedColor = COLOR_GRAYISHBLUE;
        }
        else
        {
            coreSelectedColor = COLOR_GRAY;
        }
    }
    
    if (_strokeNormalColor) strokeNormalColor = _strokeNormalColor;
    else 
    {
        if (_pageControlStyle==PageControlStyleDefault && _coreNormalColor)
        {
            strokeNormalColor = _coreNormalColor;
        }
        else
        {
            strokeNormalColor = COLOR_GRAYISHBLUE;
        }
        
    }
    
    if (_strokeSelectedColor) strokeSelectedColor = _strokeSelectedColor;
    else
    {
        if (_pageControlStyle==PageControlStyleStrokedCircle || _pageControlStyle==PageControlStyleWithPageNumber)
        {
            strokeSelectedColor = COLOR_GRAYISHBLUE;
        }
        else if (_pageControlStyle==PageControlStyleDefault && _coreSelectedColor)
        {
            strokeSelectedColor = _coreSelectedColor;
        }
        else
        {
            strokeSelectedColor = COLOR_GRAY;
        }
    }
    
    // Drawing code
    if (_hidesForSinglePage && _numberOfPages==1)
	{
		return;
	}
	
	CGContextRef myContext = UIGraphicsGetCurrentContext();
	
	int gap = _gapWidth;
    float diameter = _diameter - 2*_strokeWidth;
    
    if (self.pageControlStyle==PageControlStyleThumb)
    {
        if (_thumbImage && _selectedThumbImage)
        {
            diameter = _thumbImage.size.width;
        }
    }
	
	int total_width = _numberOfPages*diameter + (_numberOfPages-1)*gap;
	
	if (total_width>self.frame.size.width)
	{
		while (total_width>self.frame.size.width)
		{
			diameter -= 2;
			gap = diameter + 2;
			while (total_width>self.frame.size.width) 
			{
				gap -= 1;
				total_width = _numberOfPages*diameter + (_numberOfPages-1)*gap;
				
				if (gap==2)
				{
					break;
					total_width = _numberOfPages*diameter + (_numberOfPages-1)*gap;
				}
			}
			
			if (diameter==2)
			{
				break;
				total_width = _numberOfPages*diameter + (_numberOfPages-1)*gap;
			}
		}
		
		
	}
	
	int i;
	for (i=0; i<_numberOfPages; i++)
	{
		int x = (self.frame.size.width-total_width)/2 + i*(diameter+gap);

        if (_pageControlStyle==PageControlStyleDefault)
        {
            if (i==_currentPage)
            {
                CGContextSetFillColorWithColor(myContext, [coreSelectedColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeSelectedColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
            else
            {
                CGContextSetFillColorWithColor(myContext, [coreNormalColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeNormalColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
        }
        else if (_pageControlStyle==PageControlStyleStrokedCircle)
        {
            CGContextSetLineWidth(myContext, _strokeWidth);
            if (i==_currentPage)
            {
                CGContextSetFillColorWithColor(myContext, [coreSelectedColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeSelectedColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
            else
            {
                CGContextSetStrokeColorWithColor(myContext, [strokeNormalColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
        }
        else if (_pageControlStyle==PageControlStyleWithPageNumber)
        {
            CGContextSetLineWidth(myContext, _strokeWidth);
            if (i==_currentPage)
            {
                int _currentPageDiameter = diameter*1.6;
                x = (self.frame.size.width-total_width)/2 + i*(diameter+gap) - (_currentPageDiameter-diameter)/2;
                CGContextSetFillColorWithColor(myContext, [coreSelectedColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-_currentPageDiameter)/2,_currentPageDiameter,_currentPageDiameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeSelectedColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-_currentPageDiameter)/2,_currentPageDiameter,_currentPageDiameter));
            
                NSString *pageNumber = [NSString stringWithFormat:@"%i", i+1];
                CGContextSetFillColorWithColor(myContext, [[UIColor whiteColor] CGColor]);
                [pageNumber drawInRect:CGRectMake(x,(self.frame.size.height-_currentPageDiameter)/2-1,_currentPageDiameter,_currentPageDiameter) withFont:[UIFont systemFontOfSize:_currentPageDiameter-2] lineBreakMode:UILineBreakModeCharacterWrap alignment:UITextAlignmentCenter];
            }
            else
            {
                CGContextSetStrokeColorWithColor(myContext, [strokeNormalColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
        }
        else if (_pageControlStyle==PageControlStylePressed1 || _pageControlStyle==PageControlStylePressed2)
        {
            if (_pageControlStyle==PageControlStylePressed1)
            {
                CGContextSetFillColorWithColor(myContext, [[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2-1,diameter,diameter));
            }
            else if (_pageControlStyle==PageControlStylePressed2)
            {
                CGContextSetFillColorWithColor(myContext, [[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1] CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2+1,diameter,diameter));
            }
            
            
            if (i==_currentPage)
            {
                CGContextSetFillColorWithColor(myContext, [coreSelectedColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeSelectedColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
            else
            {
                CGContextSetFillColorWithColor(myContext, [coreNormalColor CGColor]);
                CGContextFillEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
                CGContextSetStrokeColorWithColor(myContext, [strokeNormalColor CGColor]);
                CGContextStrokeEllipseInRect(myContext, CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter));
            }
        }
        else if (self.pageControlStyle==PageControlStyleThumb)
        {
            if (_thumbImage && _selectedThumbImage)
            {
                if (i==_currentPage)
                {
                    [_selectedThumbImage drawInRect:CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter)];
                }
                else
                {
                    [_thumbImage drawInRect:CGRectMake(x,(self.frame.size.height-diameter)/2,diameter,diameter)];
                }
            }
        }
	}
}



- (PageControlStyle)pageControlStyle
{
    return _pageControlStyle;
}

- (void)setPageControlStyle:(PageControlStyle)style
{
    _pageControlStyle = style;
    [self setNeedsDisplay];
}

- (void)setCurrentPage:(int)page
{
    _currentPage = page;
    [self setNeedsDisplay];
}

- (int)currentPage
{
    return _currentPage;
}

- (void)setNumberOfPages:(int)numOfPages
{
    _numberOfPages = numOfPages;
    [self setNeedsDisplay];
}

- (int)numberOfPages
{
    return _numberOfPages;
}


@end
