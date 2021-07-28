int main() {
  int i, j;
  int a[100], b[100][100];
  for (i = 0; i < 100; i++)
    a[i] = 10;

  for (i = 0; i < 100; i++)
    for (j = 0; j < 100; j++)
      b[i][j] -= 3;
  return 0;
}
