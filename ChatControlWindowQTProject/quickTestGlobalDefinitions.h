#ifndef QUICKTESTGLOBALDEFINITONS_H
#define QUICKTESTGLOBALDEFINITONS_H


#if defined(QUICKTESTDLL_EXPORTS)//defined in project variables for compilation
#  define QUICKTESTDLL_API __declspec(dllexport)
#else
#  define QUICKTESTDLL_API __declspec(dllimport)
#endif

#endif // QUICKTESTGLOBALDEFINITONS_H