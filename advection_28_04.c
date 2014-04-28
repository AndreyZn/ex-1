#include <math.h>
#include <stdio.h>
#include "drawme.h"

        int main () {


                int N, M = 10;
                N = 10;
                double h, Cx = 1.0, k = 0.6;
                h = 2.0/N; //Piece size

                double tau;
                tau = k*h/Cx;

                int i;


                double x[11];
                for (i = 0; i < (N+1); i++) {
                x[i] =i*h - 1;
                }


                double U[11];
                for (i = 0; i < (N+1); i++) {
                U[i] = 0;
                if ((x[i]>=(-0.5))&&(x[i]<=0.5)) {
                U[i] = 1;
                }
                }



                double a;
                for (i = 0; M > 0; i++) {

                if (i == 0) {
                         a = (U[i] - U[N])/(x[i]-x[N]);
                         }      else {
                         a = (U[i] - U[i-1])/(x[i]-x[i-1]);
                         }
                        //      y=ax+b; U[i-1]
                         U[i]=(x[i] - Cx*tau)*a + U[i-1]-a*x[i-1];
                                DM_plot_1d(x, U, N, "Test 1", 1);
 M--;
                         printf("%f ", U[i]);
                         if (i == N) {
                         //M--;
                         i = 0;
                         //DM_plot_1d(x, U, N, "Test 1", 1);
                         //DM_plot_1d(x, U, N, "Test 1", 0);
                         printf("\n");
                         }
                         }


                         return 0;
                         }
