int main() {
  int i, j, k, a[100], b[100][100];
  for (i = 0; i < 100; i++)
    a[i] = 10;
  for (j = 0; j < 100; j++)
    for (k = 0; k < 100; k++)
      for (i = 0; i < 100; i++)
        b[j][k] -= 3;
}
