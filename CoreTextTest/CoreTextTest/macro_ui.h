//
//  macro_ui.h
//  CoreTextTest
//
//  Created by mac on 2020/1/9.
//  Copyright © 2020 lwb. All rights reserved.
//

#ifndef macro_ui_h
#define macro_ui_h

#ifdef DEBUG
    #define debugLog(...) NSLog(__VA_ARGS__)
    #define debugMethod() NSLog(@"%s", __func__)
#else
    #define debugLog(...)
    #define debugMethod()
#endif
#define RGB(A, B, C)    [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]



#endif /* macro_ui_h */
