#include <iostream>
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<iomanip>
using namespace std;


double A[3][3];
int row=0;
int col=0;
double max_num1=0;

void open_file()
{

    FILE *fp;
    fp = fopen("matrix.txt", "r");      //3*3矩阵由外部读入
    if(fp==NULL)
        cout<<"File opened failed!"<<endl;

    for(row=0;row<3;row++)
    {
        for(col= 0; col < 3; col ++)
            fscanf(fp, "%lf,",&A[row][col]);
        if(feof(fp)) break;
    }
    fclose(fp);
}

double Y[3]={1,1,1};
double X[3]={0,0,0};
double Y_pre[3]={1,1,1};
double delta = 1;
double max_num;
double min_num;
void mult()
{
    X[0]=0;X[1]=0;X[2]=0;
    for(row=0;row<3;row++)
    {
        for(col=0;col<3;col++)
            X[row] +=A[row][col]*Y[col];
    }
}

void to1()
{
    long double tmp=fabs(X[0]);
    cout<<"lambda:";
     max_num = 0;
     min_num = 10000;
    for(int i=0;i<3;i++)
    {
        if(X[i]/Y[i] > max_num) max_num = X[i]/Y[i];
        if(X[i]/Y[i] < min_num) min_num = X[i]/Y[i];
        printf(" %.4lf",X[i]/Y[i]);
        Y_pre[i] = X[i];
        if(fabs(X[i])>tmp)
            tmp=fabs(X[i]);
    }
    delta = max_num - min_num;
    cout<<",";
    for(int i=0;i<3;i++)
    {
        Y[i]=X[i]/tmp;
    }
    max_num1=tmp;
}
int main()
{
    cout <<setiosflags(ios::fixed);
    open_file();
    double ago=max_num1+100.0;
    double feature_vector[3];
    int k=1;
    while(delta>0.0005)
    {
          ago=max_num1;
          mult();
          to1();
          for(int j=0;j<3;j++)
          {
              feature_vector[j]=X[j];
          }

            cout<<"k= "<<k<<"  ";
            for(int i=0;i<3;i++)
                printf("%.4lf ",X[i]);
            cout<<endl;
            k++;
    }
    double l = 1;
    for(int i = 0;i < k-1;i++){
        l*= (max_num+min_num);
        l/=2;
    }
    cout<<endl<<"totally run "<<k-1<<" times"<<endl;
    cout<<endl<<"the matrix eigenvalue is "<<max_num1<<endl;
    cout<<endl<<"the feature vector is "<<"["<<Y[0]<<" , "<<Y[1]<<" , "<<Y[2]<<"]"<<endl;



}
