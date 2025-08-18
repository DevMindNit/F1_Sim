#pragma once
#include <random>

using namespace std;

class RANDOM
{
    public:
    int random_integer(int min, int max);

    private:
    random_device rd;
    mt19937 gen{rd()};
};