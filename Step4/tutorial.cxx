// A simple program that computes the square root of a number
#include <cmath>
#include <iostream>
#include <string>

#include "MathFunctions.h"
#include "TutorialConfig.h"

int main(int argc, char* argv[])
{
  if (argc < 2) {
    // report version
    std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR << "."
              << Tutorial_VERSION_MINOR << std::endl;
    std::cout << "Usage: " << argv[0] << " number" << std::endl;
    return 1;
  }
  int a; // unused variable to test the compiler
  // convert input to double
  double const inputValue = std::stod(argv[1]);

  double const outputValue = mathfunctions::sqrt(inputValue);

  std::cout << "The square root of " << inputValue << " is " << outputValue
            << std::endl;
  return 0;
}
