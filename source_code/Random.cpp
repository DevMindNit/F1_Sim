#include "Random.h"

int RANDOM::random_integer(int min, int max) {
    std::uniform_int_distribution<int> dis(min, max);
    return dis(gen);
}