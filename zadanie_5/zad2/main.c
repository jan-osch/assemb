#include <stdio.h>

extern void prostopadloscian( float a, float b, float c, float * objetosc, float * pole);

int main()
{
    float a, b, c, vol, area;

    printf("Enter a , b, c: ");
    scanf("%f %f %f", &a, &b, &c);

    prostopadloscian(a, b, c, &vol, &area);
    printf ("area: %.10g \n", area);
    printf ("volume: %.10g \n", vol);

    return 0;
}
