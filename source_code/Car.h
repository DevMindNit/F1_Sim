#pragma once


class Car
{
    public:
    Car();
    ~Car();

    void            Run();

    void            setFuelStatus(float fuel);
    float           getFuelStatus() { return car_fuel_; }

    private:
    float           car_fuel_{1.0f};
};