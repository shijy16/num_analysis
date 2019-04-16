#include<iostream>
#include<cmath>
#include<fstream>
#include<cstring>
#include<algorithm>
#include<queue>
#define MAX(x,y)  (((x)>(y))?(x):(y))
#define MIN(x,y)  (((x)<(y))?(x):(y))
 
using namespace std;
 
const int MAXN=10005;
typedef long long LL;
double a[MAXN][MAXN];///系数矩阵
double b[MAXN],x[MAXN];///右端项及解
int n,N;///n元方程组，最大迭代N次
double eps;///误差限
double w = 1; //for SOR
int main()
{
    int ok,cur;///cur表示迭代结束所执行的最后一步
    ///freopen("in.txt","r",stdin);
    while(scanf("%d%d%lf",&n,&N,&eps) != EOF){
        ok = 0;
        for(int i = 0;i<n;i++){///输入系数矩阵
            for(int j = 0;j<n;j++){
                scanf("%lf",&a[i][j]);
            }
        }
        for(int i = 0;i<n;i++)scanf("%lf",&b[i]);///输入右端项
        for(int i = 0;i<n;i++)scanf("%lf",&x[i]);///输入初始解向量
 
        double maxs = 0,xx;
        for(int k = 1;k<=N;k++){///最大循环步数
            maxs = 0;
            for(int i = 0;i<n;i++){
                    xx = x[i];
                    x[i] = b[i];
                for(int j = 0;j<n;j++)if(i!=j){
                    x[i] -= x[j]*a[i][j];
                }
                x[i] /= a[i][i];
                x[i] = w*x[i] + (1-w)*xx;
                if(maxs < fabs(x[i] - xx))maxs = fabs(x[i] - xx);
            }
            if(maxs < eps){ok = 1;cur = k;break;}
            printf("solution %d :\n",k);
            for(int i = 0;i<n;i++){
                cout << x[i] << endl;
            }
        }
 
        if(ok){
            printf("solution :\n");
            for(int i = 0;i<n;i++){
                cout << x[i] << endl;
            }
        }
        else cout << "failed" << endl;
    }
    return 0;
}