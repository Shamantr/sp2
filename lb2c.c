#include <stdio.h>

int main()
{
	int arr[12] = {3, 8, 303, 40, 15, 77, 123, 90, 245, 45, 68, 201};
	int gr_m = 0;
	int less_m = 0;
	int M = 0;
	int i = 0;

	printf(" Enter number: ");
	scanf("%d", &M);

	for(; i<12; ++i)
	{
		if (arr[i]>M)
		{
			++gr_m;
		}

		if (arr[i]<M)
		{
			++less_m;
		}
	}

	printf(" %d of A elements > %d\n", gr_m, M);
	printf(" %d of A elementf < %d\n", less_m, M);

	return 0;
}
